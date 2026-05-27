import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:mocktail/mocktail.dart';
import 'package:cs_smoke_app/view/widgets/youtube/youtube_controls.dart';
import 'package:cs_smoke_app/core/models/info_model.dart';
import 'package:cs_smoke_app/core/viewmodels/rating_view_model.dart';
import '../../helpers/mocks.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:cs_smoke_app/l10n/app_localizations.dart';
import 'package:cs_smoke_app/view/widgets/report_bottom_sheet.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  
  setUp(() {
    setupMocks();
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('YoutubeControls renders correctly and handles interaction', (WidgetTester tester) async {
    final mockFirestore = MockFirestoreService();
    when(() => mockFirestore.updateRating(
      videoId: any(named: 'videoId'),
      newRating: any(named: 'newRating'),
      oldRating: any(named: 'oldRating')
    )).thenAnswer((_) async {});
    when(() => mockFirestore.submitReport(any(), any())).thenAnswer((_) async {});
    
    final ratingViewModel = RatingViewModel(firestoreService: mockFirestore);

    final testInfo = InfoModel(
      description: 'Test Smoke',
      videoId: 'vid123',
      position: [0.5, 0.5],
    );

    await tester.pumpWidget(
      ChangeNotifierProvider<RatingViewModel>.value(
        value: ratingViewModel,
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          onGenerateRoute: (settings) {
            return MaterialPageRoute(
              settings: RouteSettings(arguments: testInfo),
              builder: (context) => const Scaffold(
                body: YoutubeControls(),
              ),
            );
          },
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Test Smoke'), findsOneWidget);
    
    // Initial state check
    expect(find.byIcon(Icons.thumb_up_outlined), findsOneWidget);
    expect(find.byIcon(Icons.thumb_down_outlined), findsOneWidget);
    expect(find.byIcon(Icons.flag_outlined), findsOneWidget);

    // Tap like
    await tester.tap(find.byIcon(Icons.thumb_up_outlined));
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.thumb_up), findsOneWidget);

    // Tap report
    await tester.tap(find.byIcon(Icons.flag_outlined));
    await tester.pumpAndSettle();
    
    expect(find.byType(ReportBottomSheet), findsOneWidget); // Should open bottom sheet
  });
}
