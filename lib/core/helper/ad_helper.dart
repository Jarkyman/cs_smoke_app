import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AdHelper {
  static String get bannerAdUnitId {
    if (kDebugMode) {
      if (Platform.isAndroid) {
        return 'ca-app-pub-3940256099942544/6300978111';
      } else if (Platform.isIOS) {
        return 'ca-app-pub-3940256099942544/2934735716';
      }
    }

    if (Platform.isAndroid) {
      return dotenv.env['ADMOB_BANNER_ANDROID'] ?? '';
    } else if (Platform.isIOS) {
      return dotenv.env['ADMOB_BANNER_IOS'] ?? '';
    }
    return 'ca-app-pub-3940256099942544/6300978111';
  }

  static String get nativeAdUnitId {
    if (kDebugMode) {
      if (Platform.isAndroid) {
        return 'ca-app-pub-3940256099942544/2247696110';
      } else if (Platform.isIOS) {
        return 'ca-app-pub-3940256099942544/3986624511';
      }
    }

    if (Platform.isAndroid) {
      return dotenv.env['ADMOB_NATIVE_ANDROID'] ?? '';
    } else if (Platform.isIOS) {
      return dotenv.env['ADMOB_NATIVE_IOS'] ?? '';
    }
    return 'ca-app-pub-3940256099942544/2247696110';
  }
}
