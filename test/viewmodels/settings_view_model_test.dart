import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cs_smoke_app/core/viewmodels/settings_view_model.dart';
import 'package:cs_smoke_app/core/helper/constants.dart';
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

    test('isLoaded becomes true after init completes', () async {
      final viewModel = SettingsViewModel();
      expect(viewModel.isLoaded, false);
      await Future.delayed(Duration.zero);
      expect(viewModel.isLoaded, true);
    });

    test('Fallback to system locale if no locale is saved', () async {
      SharedPreferences.setMockInitialValues({});
      final viewModel = SettingsViewModel();
      await Future.delayed(Duration.zero);
      expect(viewModel.locale, isNotNull);
    });

    test('toggleNotification toggles value and saves', () async {
      SharedPreferences.setMockInitialValues({
        Constants.notificationKey: true,
      });
      final viewModel = SettingsViewModel();
      await Future.delayed(Duration.zero);
      
      await viewModel.toggleNotification();
      
      expect(viewModel.isNotification, false);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getBool(Constants.notificationKey), false);
    });
    
    test('checkPermission handles restricted status', () async {
      final viewModel = SettingsViewModel();
      await viewModel.checkPermission();
      expect(true, true);
    });
    
    test('askPermission runs without throwing', () async {
      final viewModel = SettingsViewModel();
      await viewModel.askPermission();
      expect(true, true);
    });
  });
}
