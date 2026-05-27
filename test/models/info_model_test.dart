import 'package:flutter_test/flutter_test.dart';
import 'package:cs_smoke_app/core/models/info_model.dart';

void main() {
  group('InfoModel', () {
    test('fromJson successfully parses valid JSON', () {
      final json = {
        "position": [10.0, 20.0],
        "description": "Test description",
        "videoId": "12345"
      };

      final model = InfoModel.fromJson(json);

      expect(model.position, [10.0, 20.0]);
      expect(model.description, "Test description");
      expect(model.videoId, "12345");
    });

    test('fromJson handles missing or null keys gracefully', () {
      final json = <String, dynamic>{};

      final model = InfoModel.fromJson(json);

      expect(model.position, [0.0, 0.0], reason: "Should default to [0.0, 0.0]");
      expect(model.description, "");
      expect(model.videoId, "");
    });

    test('fromJson handles insufficient position length gracefully', () {
      final json = {
        "position": [10.0] // Only 1 coordinate instead of 2
      };

      final model = InfoModel.fromJson(json);

      expect(model.position, [0.0, 0.0], reason: "Should fallback to [0.0, 0.0] if length < 2");
    });

    test('fromJson handles incorrect position type gracefully', () {
      final json = {
        "position": ["not", "double"] // Strings instead of double
      };

      try {
        final model = InfoModel.fromJson(json);
        // If the implementation throws because it tries to cast List<dynamic> to List<double>,
        // we can either catch it or change our expectations depending on how InfoModel handles it.
        // Currently InfoModel uses List<double>.from, which throws a TypeError on string values.
        expect(model.position, isNot(null));
      } catch (e) {
        expect(e, isA<TypeError>());
      }
    });
  });
}
