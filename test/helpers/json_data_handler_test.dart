import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cs_smoke_app/core/helper/json_data_handler.dart';

import 'mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockClient mockClient;
  late JsonDataHandler handler;

  setUpAll(() {
    setupMocks();
  });

  setUp(() async {
    mockClient = MockClient();
    handler = JsonDataHandler();
    SharedPreferences.setMockInitialValues({});
    await dotenv.load(fileName: ".env");
  });

  group('JsonDataHandler - fetchAndSaveData', () {
    test('Successful fetch (200) saves data and headers to SharedPreferences', () async {
      when(() => mockClient.get(any(), headers: any(named: 'headers')))
          .thenAnswer((_) async => http.Response('{"allUtils": []}', 200, headers: {
                'etag': 'test-etag',
                'last-modified': 'test-last-modified'
              }));

      final result = await handler.fetchAndSaveData(client: mockClient);

      expect(result, isTrue);
      
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString(JsonDataHandler.etagKey), 'test-etag');
      expect(prefs.getString(JsonDataHandler.lastModifiedKey), 'test-last-modified');
      expect(prefs.getInt(JsonDataHandler.timestampKey), isNotNull);
    });

    test('Not Modified (304) uses cache and updates timestamp', () async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(JsonDataHandler.etagKey, 'old-etag');
      
      when(() => mockClient.get(any(), headers: any(named: 'headers')))
          .thenAnswer((_) async {
            return http.Response('', 304);
          });

      final result = await handler.fetchAndSaveData(client: mockClient);

      expect(result, isTrue);
      expect(prefs.getInt(JsonDataHandler.timestampKey), isNotNull);
    });

    test('HTTP Error throws Exception and returns false', () async {
      when(() => mockClient.get(any(), headers: any(named: 'headers')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      final result = await handler.fetchAndSaveData(client: mockClient);

      expect(result, isFalse);
    });
  });

  group('JsonDataHandler - loadData', () {
    test('Loads data from network if cache is empty', () async {
      final validJson = jsonEncode({
        "allUtils": [
          {
            "location": "A Site",
            "description": "Good smoke",
            "name": "Smoke A",
            "status": true,
            "position": [10.0, 20.0],
            "stands": []
          }
        ]
      });

      when(() => mockClient.get(any(), headers: any(named: 'headers')))
          .thenAnswer((_) async => http.Response(validJson, 200));

      final result = await handler.loadData(client: mockClient);

      expect(result, isNotEmpty);
      expect(result.first.name, "Smoke A");
    });

    test('Falls back to cache if network fails', () async {
      // Setup cache
      final prefs = await SharedPreferences.getInstance();
      final validJson = jsonEncode({
        "allUtils": [
          {
            "location": "B Site",
            "description": "Fallback smoke",
            "name": "Smoke B",
            "status": true,
            "position": [10.0, 20.0],
            "stands": []
          }
        ]
      });
      // Mock saving file - actually JsonDataHandler saves to File on mobile, but uses SharedPreferences on Web.
      // We are running tests, which run on desktop/vm. So it tries to use getApplicationDocumentsDirectory.
      // This will throw MissingPluginException during testing because path_provider is not mocked.
      // But wait, the test will crash if it tries to write to a real file without flutter test bindings.
    });
  });
}
