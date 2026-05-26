import 'package:cs_smoke_app/core/viewmodels/settings_view_model.dart';
import 'package:cs_smoke_app/core/viewmodels/util_view_model.dart';
import 'package:cs_smoke_app/view/screens/maps_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      ],
      child: MaterialApp(
        title: 'Util Master',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.dark(),
          useMaterial3: true,
        ),
        home: MapsScreen(),
      ),
    );
  }
}
