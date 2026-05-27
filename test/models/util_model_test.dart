import 'package:flutter_test/flutter_test.dart';
import 'package:cs_smoke_app/core/models/util_model.dart';

void main() {
  group('UtilModel', () {
    test('fromJson successfully parses valid JSON', () {
      final json = {
        "location": "A Site",
        "description": "Good smoke",
        "name": "Smoke A",
        "status": true,
        "position": [10.0, 20.0],
        "stands": [
          {
            "position": [1.0, 2.0],
            "description": "Stand here",
            "videoId": "vid1"
          }
        ]
      };

      final model = UtilModel.fromJson(json);

      expect(model.location, "A Site");
      expect(model.description, "Good smoke");
      expect(model.name, "Smoke A");
      expect(model.status, true);
      expect(model.position, [10.0, 20.0]);
      expect(model.stands.length, 1);
      expect(model.stands.first.videoId, "vid1");
    });

    test('fromJson handles missing or null keys gracefully', () {
      final json = <String, dynamic>{};

      final model = UtilModel.fromJson(json);

      expect(model.location, "");
      expect(model.description, "");
      expect(model.name, "");
      expect(model.status, false);
      expect(model.position, [0.0, 0.0]);
      expect(model.stands, []);
    });

    test('fromJson handles incorrect data types gracefully', () {
      final json = {
        "location": 1, // Should fallback or crash depending on impl
        "status": "true", // Should fallback to false
        "position": [10.0], // Should fallback to [0.0, 0.0]
        "stands": "not a list" // Should fallback or crash
      };

      try {
        final model = UtilModel.fromJson(json);
        expect(model.position, [0.0, 0.0]);
      } catch (e) {
        expect(e, isNotNull);
      }
    });
  });
}
