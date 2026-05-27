import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:cs_smoke_app/view/widgets/raw_gesture_detector_widget.dart';
import 'package:cs_smoke_app/core/viewmodels/radar_view_model.dart';

void main() {
  testWidgets('RawGestureDetectorWidget registers scaling gestures', (WidgetTester tester) async {
    final radarViewModel = RadarViewModel();

    await tester.pumpWidget(
      ChangeNotifierProvider<RadarViewModel>.value(
        value: radarViewModel,
        child: MaterialApp(
          home: Scaffold(
            body: RawGestureDetectorWidget(
              child: Container(
                width: 200,
                height: 200,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.byType(RawGestureDetectorWidget), findsOneWidget);
    
    // Simulate scale
    final center = tester.getCenter(find.byType(RawGestureDetectorWidget));
    
    final TestGesture gesture1 = await tester.createGesture();
    final TestGesture gesture2 = await tester.createGesture();

    await gesture1.down(center - const Offset(10, 0));
    await gesture2.down(center + const Offset(10, 0));

    await tester.pump();
    
    // Check if it triggered start
    expect(radarViewModel.hasTouched, true);
    
    // Move gestures apart to scale up
    await gesture1.moveBy(const Offset(-10, 0));
    await gesture2.moveBy(const Offset(10, 0));
    
    await tester.pump();
    
    expect(radarViewModel.scale > RadarViewModel.minScale, true);

    await gesture1.up();
    await gesture2.up();
  });
}
