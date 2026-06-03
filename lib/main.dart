import 'dart:async';
import 'package:cs_smoke_app/view/screens/create_pin_screen.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:cs_smoke_app/core/viewmodels/settings_view_model.dart';
import 'package:cs_smoke_app/core/viewmodels/util_view_model.dart';
import 'package:cs_smoke_app/core/viewmodels/rating_view_model.dart';
import 'package:cs_smoke_app/core/viewmodels/user_util_view_model.dart';
import 'package:cs_smoke_app/view/screens/maps_screen.dart';
import 'package:cs_smoke_app/view/shared/global.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/services.dart';
import 'package:cs_smoke_app/l10n/app_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest_all.dart' as tz;

import 'core/helper/review.dart';
import 'core/viewmodels/radar_view_model.dart';
import 'firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'core/helper/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load .env and Firebase first as they are needed for configurations/analytics
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Run non-critical initializations in the background to avoid blocking the main startup thread
  MobileAds.instance.initialize().then((initializationStatus) {
    initializationStatus.adapterStatuses.forEach((key, value) {
      debugPrint('Adapter status for $key: ${value.description}');
    });
  });

  Review.rateMyApp.init();
  Constants.init();
  tz.initializeTimeZones();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Route Flutter framework errors to Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  // Route Dart/platform errors (outside Flutter framework) to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  runApp(const MyApp());

  // Request notification permissions after the app has started drawing its first frame to avoid a black screen hang
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    final bool isDenied = await Permission.notification.isDenied;
    if (isDenied) {
      await Permission.notification.request();
    }
  });
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription _intentDataStreamSubscription;

  @override
  void initState() {
    super.initState();

    // For sharing coming from outside the app while the app is in the memory
    _intentDataStreamSubscription = ReceiveSharingIntent.instance.getMediaStream().listen((List<SharedMediaFile> value) {
      _handleSharedMedia(value);
    }, onError: (err) {
      debugPrint("getMediaStream error: $err");
    });

    // For sharing coming from outside the app while the app is closed
    ReceiveSharingIntent.instance.getInitialMedia().then((List<SharedMediaFile> value) {
      _handleSharedMedia(value);
    });
  }

  void _handleSharedMedia(List<SharedMediaFile> value) {
    if (value.isNotEmpty) {
      // We look for text/url
      final media = value.firstWhere(
        (e) => e.type == SharedMediaType.text || e.type == SharedMediaType.url,
        orElse: () => value.first,
      );
      final String sharedText = media.path;
      
      // Basic extraction of URL if they shared text with a URL in it
      final RegExp urlRegex = RegExp(r'(https?:\/\/[^\s]+)');
      final match = urlRegex.firstMatch(sharedText);
      final String url = match != null ? match.group(0)! : sharedText;

      if (url.startsWith('http')) {
        // Small delay to ensure navigator is attached if app just opened
        Future.delayed(const Duration(milliseconds: 500), () {
          navigatorKey.currentState?.push(
            MaterialPageRoute(
              builder: (context) => CreatePinScreen(prefillUrl: url),
            ),
          );
        });
      }
      ReceiveSharingIntent.instance.reset();
    }
  }

  @override
  void dispose() {
    _intentDataStreamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RadarViewModel>(
            create: (context) => RadarViewModel()),
        ChangeNotifierProvider<UtilViewModel>(
            create: (context) => UtilViewModel()),
        ChangeNotifierProvider<SettingsViewModel>(
            create: (context) => SettingsViewModel()),
        ChangeNotifierProvider<RatingViewModel>(
            create: (context) => RatingViewModel()),
        ChangeNotifierProvider<UserUtilViewModel>(
            create: (context) {
              final vm = UserUtilViewModel();
              vm.loadUserUtils();
              return vm;
            }),
      ],
      child: Consumer<SettingsViewModel>(
        builder: (context, settingsViewModel, child) {
          if (!settingsViewModel.isLoaded) {
            return MaterialApp(
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              home: const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              ),
            );
          }
          return MaterialApp(
            title: 'Util Master',
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Global.blue,
                brightness: Brightness.dark,
              ),
              scaffoldBackgroundColor: Global.bgColor,
              useMaterial3: true,
            ),
            locale: settingsViewModel.locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            home: MapsScreen(),
          );
        },
      ),
    );
  }
}
