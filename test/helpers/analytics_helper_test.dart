import 'package:flutter_test/flutter_test.dart';
import 'package:cs_smoke_app/core/helper/analytics_helper.dart';

void main() {
  group('AnalyticsHelper', () {
    test('log functions do not crash', () async {
      // analytics plugin uses method channels. We just verify the wrapper methods
      // don't crash when called in a test environment.

      expect(() => AnalyticsHelper.logMapSelected('test'), returnsNormally);
      expect(
          () => AnalyticsHelper.logUtilSelected(
              utilType: 'smoke', team: 't', mapName: 'mirage'),
          returnsNormally);
      expect(() => AnalyticsHelper.logNativeAdClicked(), returnsNormally);
      expect(() => AnalyticsHelper.logBannerAdClicked(), returnsNormally);
      expect(
        () => AnalyticsHelper.logSponsorImpression(
          sponsorId: 'sponsor_1',
          placement: 'video_page',
          appId: 'util_master',
          campaignTitle: 'Sponsor',
        ),
        returnsNormally,
      );
      expect(
        () => AnalyticsHelper.logSponsorClick(
          sponsorId: 'sponsor_1',
          placement: 'video_page',
          appId: 'util_master',
          campaignTitle: 'Sponsor',
        ),
        returnsNormally,
      );
    });
  });
}
