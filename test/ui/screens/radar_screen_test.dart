import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:cs_smoke_app/view/screens/radar_screen.dart';
import 'package:cs_smoke_app/core/viewmodels/util_view_model.dart';
import 'package:cs_smoke_app/core/viewmodels/radar_view_model.dart';
import 'package:cs_smoke_app/l10n/app_localizations.dart';

void main() {
  testWidgets('RadarScreen renders correctly', (WidgetTester tester) async {
    final utilViewModel = UtilViewModel();
    final radarViewModel = RadarViewModel();

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<UtilViewModel>.value(value: utilViewModel),
          ChangeNotifierProvider<RadarViewModel>.value(value: radarViewModel),
        ],
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          initialRoute: '/',
          onGenerateRoute: (settings) {
            return MaterialPageRoute(
              settings: const RouteSettings(arguments: 'mirage'),
              builder: (context) => const Scaffold(
                body: RadarScreen(),
              ),
            );
          },
        ),
      ),
    );

    await tester.pump();

    // Verify basic elements are present
    expect(find.byType(RadarScreen), findsOneWidget);
    // GridViewWidget is inside RadarScreen
    // expect(find.byType(GridViewWidget), findsOneWidget); 
  });
}
