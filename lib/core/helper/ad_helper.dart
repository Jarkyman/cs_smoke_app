import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-9894760850635221/1624938511';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-9894760850635221/9776661201';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  static String get nativeAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-9894760850635221/8519419851';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-9894760850635221/6823194803';
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
}

// TEST
/*
class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get nativeAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/2247696110';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/3986624511';
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}
*/
