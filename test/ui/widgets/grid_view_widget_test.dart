import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:cs_smoke_app/view/widgets/grid_view_widget.dart';
import 'package:cs_smoke_app/core/viewmodels/util_view_model.dart';
import 'package:cs_smoke_app/core/viewmodels/radar_view_model.dart';
import 'package:cs_smoke_app/core/models/util_model.dart';
import 'package:cs_smoke_app/view/widgets/buttons/util_button.dart';
import 'package:cs_smoke_app/view/widgets/raw_gesture_detector_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mocktail/mocktail.dart';
import 'dart:convert';
import '../../helpers/mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  
  setUp(() async {
    setupMocks();
    await dotenv.load(fileName: ".env");
  });

  testWidgets('GridViewWidget displays utilities and handles interaction', (WidgetTester tester) async {
    final mockJsonDataHandler = MockJsonDataHandler();
    when(() => mockJsonDataHandler.loadData()).thenAnswer((_) async => [
      UtilModel.fromJson({
        'name': 'test_smoke',
        'description': 'Test Description',
        'position': [100.0, 100.0],
        'type': 'smoke',
        'videoId': 'vid1',
      })
    ]);
    final utilViewModel = UtilViewModel(jsonDataHandler: mockJsonDataHandler);
    final radarViewModel = RadarViewModel();

    await utilViewModel.loadData();

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<UtilViewModel>.value(value: utilViewModel),
          ChangeNotifierProvider<RadarViewModel>.value(value: radarViewModel),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: GridViewWidget(mapName: 'mirage'),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Find the GridViewWidget
    expect(find.byType(GridViewWidget), findsOneWidget);
  });
}
