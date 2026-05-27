import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:cs_smoke_app/core/viewmodels/radar_view_model.dart';
import 'package:cs_smoke_app/core/viewmodels/util_view_model.dart';
import 'package:cs_smoke_app/core/viewmodels/settings_view_model.dart';
import 'package:cs_smoke_app/core/viewmodels/rating_view_model.dart';
import 'package:cs_smoke_app/view/screens/menu_screen.dart';
import 'package:cs_smoke_app/view/screens/maps_screen.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:cs_smoke_app/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../helpers/mocks.dart';

void main() {
  late MockJsonDataHandler mockJsonDataHandler;
  late MockFirestoreService mockFirestoreService;

  setUp(() async {
    setupMocks();
    SharedPreferences.setMockInitialValues({});
    await dotenv.load(fileName: ".env");

    mockJsonDataHandler = MockJsonDataHandler();
    mockFirestoreService = MockFirestoreService();

    when(() => mockJsonDataHandler.loadData()).thenAnswer((_) async => []);
    when(() => mockJsonDataHandler.fetchAndSaveData())
        .thenAnswer((_) async => true);
  });

  testWidgets('Navigation from MapsScreen to other screens',
      (WidgetTester tester) async {
    // Build the app with mocked providers
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<RadarViewModel>(
            create: (_) => RadarViewModel(),
          ),
          ChangeNotifierProvider<UtilViewModel>(
            create: (_) => UtilViewModel(jsonDataHandler: mockJsonDataHandler),
          ),
          ChangeNotifierProvider<SettingsViewModel>(
            create: (_) => SettingsViewModel(),
          ),
          ChangeNotifierProvider<RatingViewModel>(
            create: (_) =>
                RatingViewModel(firestoreService: mockFirestoreService),
          ),
        ],
        child: const MaterialApp(
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale('en'),
          home: MapsScreen(),
        ),
      ),
    );

    // Wait for splash screen or futures to settle
    await tester.pumpAndSettle();

    // Ensure we start on MapsScreen
    expect(find.byType(MapsScreen), findsOneWidget);

    // Tap on Menu button (icon)
    final menuIcon = find.byTooltip('Menu');
    await tester.tap(menuIcon);
    await tester.pumpAndSettle();

    // Verify we navigated to MenuScreen
    expect(find.byType(MenuScreen), findsOneWidget);

    // Tap back button
    await tester.pageBack();
    await tester.pumpAndSettle();

    // Verify we are back on MapsScreen
    expect(find.byType(MapsScreen), findsOneWidget);
  });
}
