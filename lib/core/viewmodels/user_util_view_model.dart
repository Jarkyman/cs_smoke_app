import 'package:cs_smoke_app/core/models/enums.dart';
import 'package:cs_smoke_app/core/models/user_util_model.dart';
import 'package:cs_smoke_app/core/services/user_util_storage.dart';
import 'package:flutter/foundation.dart';

class UserUtilViewModel extends ChangeNotifier {
  final UserUtilStorage _storage;

  UserUtilViewModel({UserUtilStorage? storage})
      : _storage = storage ?? UserUtilStorage();

  ViewState _state = ViewState.idle;
  ViewState get state => _state;

  List<UserUtilModel> _utils = [];
  List<UserUtilModel> get utils => _utils;

  // ------------------------------------------------------------------ load --
  Future<void> loadUserUtils() async {
    _state = ViewState.loading;
    notifyListeners();
    try {
      _utils = await _storage.loadUserUtils();
      _state = ViewState.success;
    } catch (e) {
      _state = ViewState.error;
      debugPrint('UserUtilViewModel.loadUserUtils error: $e');
    }
    notifyListeners();
  }

  // ------------------------------------------------------------------- add --
  Future<void> addUserUtils(List<UserUtilModel> newUtils) async {
    _utils = [..._utils, ...newUtils];
    notifyListeners();
    await _storage.saveUserUtils(_utils);
  }

  // --------------------------------------------------------------- delete --
  /// Deletes an entire user util (all its stands) by id.
  Future<void> deleteUserUtil(String id) async {
    _utils = _utils.where((u) => u.id != id).toList();
    notifyListeners();
    await _storage.saveUserUtils(_utils);
  }

  /// Deletes a single stand from a user util.
  /// If it was the last stand, the entire util is removed.
  Future<void> deleteStandFromUtil(String utilId, int standIndex) async {
    _utils = _utils.map((u) {
      if (u.id != utilId) return u;
      final newStands = List<List<double>>.from(u.standPositions)
        ..removeAt(standIndex);
      if (newStands.isEmpty) return null; // flag for removal
      return UserUtilModel(
        id: u.id,
        location: u.location,
        description: u.description,
        name: u.name,
        status: u.status,
        position: u.position,
        standPositions: newStands,
        videoUrl: u.videoUrl,
        videoType: u.videoType,
        createdAt: u.createdAt,
      );
    }).whereType<UserUtilModel>().toList();

    notifyListeners();
    await _storage.saveUserUtils(_utils);
  }

  // -------------------------------------------------------------- queries --
  /// Returns user utils for a specific map, util type and team.
  List<UserUtilModel> getUserUtilsForMapAndType(
    String location,
    String name,
    bool status,
  ) {
    return _utils.where((u) {
      return u.location == location.toLowerCase() &&
          u.name == name &&
          u.status == status;
    }).toList();
  }
}
