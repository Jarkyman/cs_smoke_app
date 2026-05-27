import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cs_smoke_app/core/viewmodels/radar_view_model.dart';
import 'package:cs_smoke_app/core/helper/dimensions.dart';

void main() {
  group('RadarViewModel', () {
    late RadarViewModel viewModel;

    setUp(() {
      viewModel = RadarViewModel();
    });

    test('Initial State starts with correct default values', () {
      expect(viewModel.scale, RadarViewModel.minScale);
      expect(viewModel.previousScale, RadarViewModel.minScale);
      expect(viewModel.pos.x, 0.0);
      expect(viewModel.pos.y, 0.0);
      expect(viewModel.isScaled, false);
      expect(viewModel.hasTouched, false);
    });

    test('reset clears all states', () {
      // Setup dirty state
      viewModel.hasTouched = true;
      viewModel.handleDragScaleStart(ScaleStartDetails(focalPoint: const Offset(10, 10)));
      viewModel.handleDragScaleUpdate(ScaleUpdateDetails(focalPoint: const Offset(10, 10), scale: 2.0));
      viewModel.handleDragScaleEnd();

      expect(viewModel.scale, 2.0);
      
      // Act
      viewModel.reset();

      // Assert
      expect(viewModel.scale, RadarViewModel.minScale);
      expect(viewModel.previousScale, RadarViewModel.minScale);
      expect(viewModel.pos.x, 0.0);
      expect(viewModel.pos.y, 0.0);
      expect(viewModel.isScaled, false);
      // reset() doesn't currently change hasTouched, which is expected by the logic
    });

    test('handleDragScaleStart sets initial variables', () {
      viewModel.handleDragScaleStart(ScaleStartDetails(focalPoint: const Offset(100, 100)));
      expect(viewModel.hasTouched, true);
      expect(viewModel.previousScale, viewModel.scale);
    });

    test('handleDragScaleUpdate applies scale correctly', () {
      viewModel.handleDragScaleStart(ScaleStartDetails(focalPoint: const Offset(100, 100)));
      viewModel.handleDragScaleUpdate(ScaleUpdateDetails(focalPoint: const Offset(100, 100), scale: 3.0));
      
      expect(viewModel.scale, 3.0);
      expect(viewModel.isScaled, true);
    });

    test('handleDragScaleUpdate prevents scaling beyond limits', () {
      viewModel.handleDragScaleStart(ScaleStartDetails(focalPoint: const Offset(100, 100)));
      
      // Below min
      viewModel.handleDragScaleUpdate(ScaleUpdateDetails(focalPoint: const Offset(100, 100), scale: 0.5));
      expect(viewModel.scale, RadarViewModel.minScale);

      // Above max
      viewModel.handleDragScaleUpdate(ScaleUpdateDetails(focalPoint: const Offset(100, 100), scale: 5.0));
      expect(viewModel.scale, RadarViewModel.maxScale);
    });
  });
}
