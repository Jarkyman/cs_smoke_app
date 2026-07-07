import 'package:cs_smoke_app/core/models/sponsor_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SponsorModel', () {
    test('parses sponsor JSON', () {
      final sponsor = SponsorModel.fromJson({
        'id': 'company_2026_01',
        'enabled': true,
        'title': 'Company Name',
        'description': 'Short sponsor text',
        'imageUrl': 'https://example.com/image.png',
        'clickUrl': 'https://example.com/ref',
        'ctaText': 'Open offer',
        'apps': ['util_master'],
        'startsAt': '2026-07-01',
        'endsAt': null,
        'weight': 2,
      });

      expect(sponsor.id, 'company_2026_01');
      expect(sponsor.enabled, isTrue);
      expect(sponsor.apps, ['util_master']);
      expect(sponsor.startsAt, DateTime(2026, 7, 1));
      expect(sponsor.endsAt, isNull);
      expect(sponsor.weight, 2);
    });

    test('creates JSON-safe log data', () {
      final sponsor = SponsorModel.fromJson({
        'id': 'company_2026_01',
        'enabled': true,
        'title': 'Company Name',
        'description': 'Short sponsor text',
        'imageUrl': 'https://example.com/image.jpg',
        'clickUrl': 'https://example.com/ref',
        'ctaText': 'Open offer',
        'apps': ['util_master'],
        'startsAt': '2026-07-01',
        'endsAt': null,
        'weight': 2,
      });

      final logJson = sponsor.toLogJson(
        placement: 'video_page',
        appId: 'util_master',
      );

      expect(logJson['placement'], 'video_page');
      expect(logJson['appId'], 'util_master');
      expect(logJson['imageUrl'], 'https://example.com/image.jpg');
      expect(logJson['endsAt'], isNull);
    });

    test('requires enabled sponsor for matching app and active date range', () {
      final sponsor = SponsorModel.fromJson({
        'id': 'company_2026_01',
        'enabled': true,
        'title': 'Company Name',
        'clickUrl': 'https://example.com/ref',
        'apps': ['util_master'],
        'startsAt': '2026-07-01',
        'endsAt': '2026-07-31',
      });

      expect(
          sponsor.isActiveForApp('util_master', DateTime(2026, 7, 15)), isTrue);
      expect(
          sponsor.isActiveForApp('other_app', DateTime(2026, 7, 15)), isFalse);
      expect(
          sponsor.isActiveForApp('util_master', DateTime(2026, 8, 1)), isFalse);
    });
  });

  group('SponsorFeed', () {
    test('parses sponsors list', () {
      final feed = SponsorFeed.fromJson({
        'version': 1,
        'sponsors': [
          {
            'id': 'company_2026_01',
            'enabled': true,
            'title': 'Company Name',
            'clickUrl': 'https://example.com/ref',
          }
        ],
      });

      expect(feed.version, 1);
      expect(feed.sponsors, hasLength(1));
      expect(feed.sponsors.first.id, 'company_2026_01');
    });
  });
}
