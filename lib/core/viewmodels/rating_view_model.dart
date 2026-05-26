import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/firestore_service.dart';

class RatingViewModel extends ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();
  
  // Maps videoId to rating ("like" or "dislike")
  final Map<String, String> _ratings = {};
  
  // Maps videoId to true if reported
  final Map<String, bool> _reports = {};

  RatingViewModel() {
    _loadState();
  }

  Future<void> _loadState() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    
    for (String key in keys) {
      if (key.startsWith('rating_')) {
        final videoId = key.replaceFirst('rating_', '');
        _ratings[videoId] = prefs.getString(key)!;
      } else if (key.startsWith('reported_')) {
        final videoId = key.replaceFirst('reported_', '');
        _reports[videoId] = prefs.getBool(key)!;
      }
    }
    notifyListeners();
  }

  String? getRating(String videoId) => _ratings[videoId];
  
  bool hasReported(String videoId) => _reports[videoId] ?? false;

  Future<void> setRating(String videoId, String newRating) async {
    final oldRating = _ratings[videoId];
    if (oldRating == newRating) return; // No change

    // Update local state immediately for fast UI
    _ratings[videoId] = newRating;
    notifyListeners();

    // Save to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('rating_$videoId', newRating);

    // Send to Firestore
    await _firestoreService.updateRating(
      videoId: videoId, 
      newRating: newRating, 
      oldRating: oldRating,
    );
  }

  Future<void> submitReport(String videoId, List<String> reasons) async {
    if (hasReported(videoId)) return;

    // Update local state
    _reports[videoId] = true;
    notifyListeners();

    // Save to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('reported_$videoId', true);

    // Send to Firestore
    await _firestoreService.submitReport(videoId, reasons);
  }
}
