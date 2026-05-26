import 'package:package_info_plus/package_info_plus.dart';

class Constants {
  static const String appName = 'Util Master';
  static String appVersion = '';
  static String appBuildVersion = '';
  static const String iosId = '6470121185';
  static const String androidId = 'com.hartvig_develop.util_master';

  //KEYS
  static const String notificationKey = 'notification';

  // Config
  static const int cacheValidHours = 48;
  static const String shareAppUrl =
      'https://hartvigsolutions.com/#util-master/download';

  static Future<void> init() async {
    final packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
    appBuildVersion = packageInfo.buildNumber;
  }
}
