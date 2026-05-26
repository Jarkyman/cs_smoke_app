import 'package:cs_smoke_app/core/viewmodels/settings_view_model.dart';
import 'package:cs_smoke_app/core/viewmodels/util_view_model.dart';
import 'package:cs_smoke_app/core/viewmodels/rating_view_model.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
      ],
      child: Consumer<SettingsViewModel>(
        builder: (context, settingsViewModel, child) {
          return MaterialApp(
            title: 'Util Master',
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
