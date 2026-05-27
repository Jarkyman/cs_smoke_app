import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cs_smoke_app/core/services/firestore_service.dart';
import 'package:cs_smoke_app/core/helper/json_data_handler.dart';

class MockClient extends Mock implements http.Client {}

class MockSharedPreferences extends Mock implements SharedPreferences {}

class MockFirestoreService extends Mock implements FirestoreService {}

class MockJsonDataHandler extends Mock implements JsonDataHandler {}

void setupMocks() {
  registerFallbackValue(Uri());
  
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(
          const MethodChannel('plugins.flutter.io/path_provider'),
          (MethodCall methodCall) async {
    if (methodCall.method == 'getApplicationDocumentsDirectory') {
      return '.';
    }
    return null;
  });
}
