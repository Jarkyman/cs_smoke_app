import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cs_smoke_app/core/viewmodels/settings_view_model.dart';
import 'package:cs_smoke_app/core/helper/constants.dart';
import 'package:permission_handler/permission_handler.dart';
import '../helpers/mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  
  group('SettingsViewModel', () {
    setUp(() {
      setupMocks();
      SharedPreferences.setMockInitialValues({
        Constants.notificationKey: true,
        Constants.languageKey: 'en',
      });
    });

    test('Initial State loads from SharedPreferences', () async {
      final viewModel = SettingsViewModel();
      // Wait for async _init to complete
      await Future.delayed(Duration.zero);
      
      expect(viewModel.isNotification, true); // Permission handler mock will likely override this, but let's test basic flow
      expect(viewModel.locale?.languageCode, 'en');
    });

    test('setLocale updates language and saves to SharedPreferences', () async {
      final viewModel = SettingsViewModel();
      await Future.delayed(Duration.zero);
      
      await viewModel.setLocale(const Locale('da'));
      
      expect(viewModel.locale?.languageCode, 'da');
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString(Constants.languageKey), 'da');
    });
  });
}
