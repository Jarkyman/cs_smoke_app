import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionName = 'video_stats';

  /// Updates the rating for a video.
  /// If [oldRating] is provided (meaning the user switched from like to dislike or vice versa),
  /// it will decrement the old rating.
  Future<void> updateRating({
    required String videoId,
    required String newRating, // "like" or "dislike"
    String? oldRating, // "like" or "dislike" or null
  }) async {
    try {
      final docRef = _firestore.collection(_collectionName).doc(videoId);
      
      Map<String, dynamic> updates = {
        '${newRating}s': FieldValue.increment(1),
      };

      if (oldRating != null && oldRating != newRating) {
        updates['${oldRating}s'] = FieldValue.increment(-1);
      }

      await docRef.set(updates, SetOptions(merge: true));
    } catch (e) {
      debugPrint('Error updating rating: $e');
    }
  }

  /// Submits a report for a video.
  /// [reasons] is a list of selected reason keys (e.g., "report_outdated_video").
  Future<void> submitReport(String videoId, List<String> reasons) async {
    try {
      if (reasons.isEmpty) return;

      final docRef = _firestore.collection(_collectionName).doc(videoId);
      
      Map<String, dynamic> updates = {};
      for (var reason in reasons) {
        updates[reason] = FieldValue.increment(1);
      }

      await docRef.set(updates, SetOptions(merge: true));
    } catch (e) {
      debugPrint('Error submitting report: $e');
    }
  }
}
