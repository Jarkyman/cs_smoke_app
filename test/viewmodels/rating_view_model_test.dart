import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cs_smoke_app/core/viewmodels/rating_view_model.dart';

import '../helpers/mocks.dart';

void main() {
  late MockFirestoreService mockFirestore;
  late RatingViewModel viewModel;

  setUp(() {
    mockFirestore = MockFirestoreService();
    SharedPreferences.setMockInitialValues({});
  });

  group('RatingViewModel', () {
    test('initializes state from SharedPreferences', () async {
      SharedPreferences.setMockInitialValues({
        'rating_vid1': 'like',
        'reported_vid2': true,
      });

      viewModel = RatingViewModel(firestoreService: mockFirestore);
      
      // Wait for async _loadState to complete
      await Future.delayed(Duration.zero);

      expect(viewModel.getRating('vid1'), 'like');
      expect(viewModel.hasReported('vid2'), isTrue);
    });

    test('setRating updates state locally and calls Firestore', () async {
      viewModel = RatingViewModel(firestoreService: mockFirestore);
      
      when(() => mockFirestore.updateRating(
            videoId: any(named: 'videoId'),
            newRating: any(named: 'newRating'),
            oldRating: any(named: 'oldRating'),
          )).thenAnswer((_) async {});

      await viewModel.setRating('vid1', 'like');

      expect(viewModel.getRating('vid1'), 'like');
      
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('rating_vid1'), 'like');

      verify(() => mockFirestore.updateRating(
            videoId: 'vid1',
            newRating: 'like',
            oldRating: null,
          )).called(1);
    });

    test('setRating handles switching from like to dislike', () async {
      SharedPreferences.setMockInitialValues({
        'rating_vid1': 'like',
      });
      viewModel = RatingViewModel(firestoreService: mockFirestore);
      await Future.delayed(Duration.zero); // let state load

      when(() => mockFirestore.updateRating(
            videoId: any(named: 'videoId'),
            newRating: any(named: 'newRating'),
            oldRating: any(named: 'oldRating'),
          )).thenAnswer((_) async {});

      await viewModel.setRating('vid1', 'dislike');

      expect(viewModel.getRating('vid1'), 'dislike');
      
      verify(() => mockFirestore.updateRating(
            videoId: 'vid1',
            newRating: 'dislike',
            oldRating: 'like',
          )).called(1);
    });

    test('submitReport updates local state and calls Firestore', () async {
      viewModel = RatingViewModel(firestoreService: mockFirestore);

      when(() => mockFirestore.submitReport(any(), any()))
          .thenAnswer((_) async {});

      await viewModel.submitReport('vid1', ['Outdated']);

      expect(viewModel.hasReported('vid1'), isTrue);

      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getBool('reported_vid1'), isTrue);

      verify(() => mockFirestore.submitReport('vid1', ['Outdated'])).called(1);
    });

    test('submitReport ignores duplicate reports', () async {
      SharedPreferences.setMockInitialValues({
        'reported_vid1': true,
      });
      viewModel = RatingViewModel(firestoreService: mockFirestore);
      await Future.delayed(Duration.zero); // let state load

      await viewModel.submitReport('vid1', ['Outdated']);

      verifyNever(() => mockFirestore.submitReport(any(), any()));
    });
  });
}
