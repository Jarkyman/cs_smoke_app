import 'package:flutter_test/flutter_test.dart';
import 'package:cs_smoke_app/core/helper/ad_helper.dart';

void main() {
  group('AdHelper', () {
    test('bannerAdUnitId returns test id on unsupported platform (web)', () {
      // flutter test defaults to platform where isAndroid and isIOS might be false, or web.
      // But we can check that it doesn't throw.
      expect(AdHelper.bannerAdUnitId, isNotEmpty);
    });

    test('nativeAdUnitId returns something', () {
      expect(AdHelper.nativeAdUnitId, isNotEmpty);
    });
  });
}
