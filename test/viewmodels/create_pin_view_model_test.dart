import 'package:cs_smoke_app/core/viewmodels/create_pin_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CreatePinViewModel', () {
    test('finalizeSession allows an empty description', () {
      final viewModel = CreatePinViewModel();

      viewModel.placeUtil(
        name: 'smoke',
        status: true,
        position: [0.1, 0.2],
      );
      viewModel.placeStand([0.3, 0.4]);
      expect(viewModel.donePositions(), isTrue);

      final utils = viewModel.finalizeSession(
        location: 'mirage',
        description: '',
        videoUrl: 'https://youtu.be/dQw4w9WgXcQ',
      );

      expect(utils, hasLength(1));
      expect(utils.first.description, '');
    });
  });
}
