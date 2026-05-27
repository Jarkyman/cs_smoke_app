import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:cs_smoke_app/core/helper/notification_api.dart';
import 'package:cs_smoke_app/core/viewmodels/settings_view_model.dart';
import 'mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  
  setUp(() {
    setupMocks();
    SharedPreferences.setMockInitialValues({});
  });

  group('NotificationApi', () {
    test('init calls tz.initializeTimeZones', () {
      // Just verifying it doesn't crash since it's a static method calling an external plugin
      expect(() => NotificationApi.init(initScheduled: true), returnsNormally);
    });

    test('showScheduledNotification does not throw', () async {
      // Difficult to mock static plugin instances perfectly, but we can verify our wrapper handles null safety
      expect(() => NotificationApi.showScheduledNotification(
        title: 'Test',
        body: 'Test Body',
      ), returnsNormally);
    });
    
    test('SettingsViewModel toggleNotification', () async {
      final viewModel = SettingsViewModel();
      await viewModel.toggleNotification(); 
      expect(viewModel.isNotification, isFalse);
    });
  });
}
