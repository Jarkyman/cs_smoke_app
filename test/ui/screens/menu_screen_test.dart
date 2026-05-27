import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cs_smoke_app/view/screens/menu_screen.dart';
import 'package:cs_smoke_app/core/viewmodels/settings_view_model.dart';
import 'package:cs_smoke_app/l10n/app_localizations.dart';
import '../../helpers/mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  
  setUp(() {
    setupMocks();
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('MenuScreen renders', (WidgetTester tester) async {
    final settingsViewModel = SettingsViewModel();

    await tester.pumpWidget(
      ChangeNotifierProvider<SettingsViewModel>.value(
        value: settingsViewModel,
        child: const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: MenuScreen(),
        ),
      ),
    );

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.byType(MenuScreen), findsOneWidget);
    expect(find.byIcon(Icons.language_outlined), findsOneWidget);
    
    // Tap Notification toggle
    final notificationTile = find.text('Notifications');
    expect(notificationTile, findsOneWidget);
    await tester.tap(notificationTile, warnIfMissed: false);
    await tester.pumpAndSettle();

    // Tap Share App
    final shareTile = find.text('Share app');
    expect(shareTile, findsOneWidget);
    await tester.tap(shareTile, warnIfMissed: false);
    await tester.pumpAndSettle();

    // Tap Language to open bottom sheet
    final languageTile = find.text('Language');
    expect(languageTile, findsOneWidget);
    await tester.tap(languageTile, warnIfMissed: false);
    await tester.pumpAndSettle();
    
    // Bottom sheet should be visible with languages
    expect(find.byType(BottomSheet), findsOneWidget);
    
    // Select English
    final englishItem = find.text('English');
    expect(englishItem, findsWidgets);
    await tester.tap(englishItem.first);
    await tester.pumpAndSettle();
  });
}
