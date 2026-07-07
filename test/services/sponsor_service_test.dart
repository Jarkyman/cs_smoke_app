import 'package:cs_smoke_app/core/services/sponsor_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('SponsorService', () {
    setUp(() {
      SharedPreferences.setMockInitialValues({});
    });

    test('default feed URL points to latest raw Gist file', () {
      expect(SponsorService.defaultFeedUrl,
          'https://gist.githubusercontent.com/Jarkyman/3b644c2c8fa4766ee646d31bef30a364/raw/sponsors.json');
    });

    test('loads sponsor feed from network and caches it', () async {
      final service = SponsorService(
        client: MockClient(
          (_) async => http.Response(
            '{"version":1,"sponsors":[{"id":"s1","enabled":true,"title":"Sponsor","clickUrl":"https://example.com"}]}',
            200,
          ),
        ),
      );

      final feed = await service.loadFeed();
      final prefs = await SharedPreferences.getInstance();

      expect(feed.sponsors, hasLength(1));
      expect(feed.sponsors.first.id, 's1');
      expect(prefs.getString(SponsorService.cacheKey), isNotNull);
    });

    test('falls back to cached sponsor feed when network fails', () async {
      SharedPreferences.setMockInitialValues({
        SponsorService.cacheKey:
            '{"version":1,"sponsors":[{"id":"cached","enabled":true,"title":"Cached","clickUrl":"https://example.com"}]}',
      });
      final service = SponsorService(
        client: MockClient((_) async => http.Response('error', 500)),
      );

      final feed = await service.loadFeed();

      expect(feed.sponsors, hasLength(1));
      expect(feed.sponsors.first.id, 'cached');
    });
  });
}
