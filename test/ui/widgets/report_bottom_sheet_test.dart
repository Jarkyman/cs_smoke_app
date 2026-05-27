import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cs_smoke_app/view/widgets/report_bottom_sheet.dart';
import 'package:cs_smoke_app/core/viewmodels/rating_view_model.dart';
import 'package:cs_smoke_app/l10n/app_localizations.dart';
import 'package:mocktail/mocktail.dart';
import '../../helpers/mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    setupMocks();
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('ReportBottomSheet renders and allows interaction', (WidgetTester tester) async {
    final mockFirestoreService = MockFirestoreService();
    when(() => mockFirestoreService.submitReport(any(), any())).thenAnswer((_) async {});
    
    final ratingViewModel = RatingViewModel(firestoreService: mockFirestoreService);
    
    await tester.pumpWidget(
      ChangeNotifierProvider<RatingViewModel>.value(
        value: ratingViewModel,
        child: const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: ReportBottomSheet(videoId: 'util_1'),
          ),
        ),
      ),
    );

    await tester.pump();

    // Verify it renders
    expect(find.byType(ReportBottomSheet), findsOneWidget);
    expect(find.byType(CheckboxListTile), findsWidgets); 
    
    // Tap a checkbox
    final checkboxFinder = find.byType(CheckboxListTile).first;
    await tester.tap(checkboxFinder);
    await tester.pump();

    // Verify checkbox is checked (the Checkbox itself is inside the tile)
    final checkbox = tester.widget<Checkbox>(find.byType(Checkbox).first);
    expect(checkbox.value, isTrue);

    // Tap submit button
    final submitButton = find.text('Submit');
    if (submitButton.evaluate().isNotEmpty) {
        await tester.tap(submitButton);
        await tester.pump();
    }
  });
}
