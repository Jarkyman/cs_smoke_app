import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:cs_smoke_app/core/models/enums.dart';
import 'package:cs_smoke_app/core/models/util_model.dart';
import 'package:cs_smoke_app/core/viewmodels/util_view_model.dart';

import '../helpers/mocks.dart';

void main() {
  late MockJsonDataHandler mockHandler;
  late UtilViewModel viewModel;

  setUp(() {
    mockHandler = MockJsonDataHandler();
    viewModel = UtilViewModel(jsonDataHandler: mockHandler);
  });

  group('UtilViewModel - Initial State', () {
    test('starts with correct default values', () {
      expect(viewModel.state, ViewState.idle);
      expect(viewModel.isUtilSelected, isFalse);
      expect(viewModel.showNames, isFalse);
      expect(viewModel.selectedTeam, Team.t);
      expect(viewModel.selectedType, UtilType.smoke);
      expect(viewModel.utils, isEmpty);
    });
  });

  group('UtilViewModel - loadData', () {
    test('successfully loads data and transitions state', () async {
      final mockData = [
        UtilModel(
          location: 'A',
          description: 'Desc',
          name: 'Smoke 1',
          status: true,
          position: [0.0, 0.0],
          stands: [],
        )
      ];

      when(() => mockHandler.loadData()).thenAnswer((_) async => mockData);

      // Trigger loadData
      await viewModel.loadData();

      expect(viewModel.state, ViewState.success);
      expect(viewModel.utils.length, 1);
    });

    test('transitions to error state on exception', () async {
      when(() => mockHandler.loadData()).thenThrow(Exception('Network Error'));

      await viewModel.loadData();

      expect(viewModel.state, ViewState.error);
      expect(viewModel.utils, isEmpty);
    });
  });

  group('UtilViewModel - Toggles and Selectors', () {
    test('toggleShowName flips showNames state', () {
      expect(viewModel.showNames, isFalse);
      viewModel.toggleShowName();
      expect(viewModel.showNames, isTrue);
    });

    test('toggleUtil changes type and team, and resets selection', () {
      viewModel.selectUtil(UtilModel(
        location: '',
        description: '',
        name: 'Test',
        status: true,
        position: [],
        stands: [],
      ));

      expect(viewModel.isUtilSelected, isTrue);

      viewModel.toggleUtil(UtilType.flash, Team.ct);

      expect(viewModel.selectedType, UtilType.flash);
      expect(viewModel.selectedTeam, Team.ct);
      expect(viewModel.isUtilSelected, isFalse);
      expect(viewModel.selectedUtil, isNull);
    });

    test('reset clears selection and showNames', () {
      viewModel.toggleShowName();
      viewModel.selectUtil(UtilModel(
        location: '',
        description: '',
        name: 'Test',
        status: true,
        position: [],
        stands: [],
      ));

      expect(viewModel.showNames, isTrue);
      expect(viewModel.isUtilSelected, isTrue);

      viewModel.reset();

      expect(viewModel.showNames, isFalse);
      expect(viewModel.isUtilSelected, isFalse);
      expect(viewModel.selectedUtil, isNull);
    });
  });
}
