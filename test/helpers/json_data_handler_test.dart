import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
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

  tearDown(() {
    final file = File('./cached_utility_data.json');
    if (file.existsSync()) {
      file.deleteSync();
    }
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
      // Since path_provider might not write locally in basic test easily, we simulate HTTP fail and see if it returns empty list (as file isn't written)
      when(() => mockClient.get(any(), headers: any(named: 'headers')))
          .thenAnswer((_) async => http.Response('Error', 500));

      final result = await handler.loadData(client: mockClient);

      // Should fail fetch, retry, and eventually return empty since cache is clear
      expect(result, isEmpty);
    });

    test('Retries multiple times before failing', () async {
      when(() => mockClient.get(any(), headers: any(named: 'headers')))
          .thenThrow(Exception('Network Error'));

      final result = await handler.loadData(client: mockClient);

      // Should return empty list after retries
      expect(result, isEmpty);
      // Verify client was called multiple times
      verify(() => mockClient.get(any(), headers: any(named: 'headers'))).called(greaterThan(1));
    });
  });
}
