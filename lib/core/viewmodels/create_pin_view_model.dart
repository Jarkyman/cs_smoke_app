import 'package:cs_smoke_app/core/models/enums.dart';
import 'package:cs_smoke_app/core/models/user_util_model.dart';
import 'package:flutter/material.dart';

/// Represents a temporarily placed utility during pin creation.
class TempUtil {
  final String name;
  final bool status;
  final List<double> position;
  final List<List<double>> stands;

  TempUtil({
    required this.name,
    required this.status,
    required this.position,
    List<List<double>>? stands,
  }) : stands = stands ?? [];

  TempUtil copyWith({List<List<double>>? stands}) {
    return TempUtil(
      name: name,
      status: status,
      position: position,
      stands: stands ?? this.stands,
    );
  }
}

/// Manages the ephemeral state during pin creation.
/// Not persisted — lives only for the duration of one creation session.
class CreatePinViewModel extends ChangeNotifier {
  CreatePinMode _mode = CreatePinMode.setUtil;
  CreatePinMode get mode => _mode;
  bool get isSetUtil => _mode == CreatePinMode.setUtil;
  bool get isSetPositions => _mode == CreatePinMode.setPositions;

  // ─────────────────────────────────────────────── pending pin state ──

  /// Position of the pin that the user has tapped but not yet confirmed.
  List<double>? _pendingPosition;

  bool get hasPending => _pendingPosition != null;
  List<double>? get pendingPosition => _pendingPosition;

  /// Stage a util pin tap (setUtil mode). Shows the pending highlight.
  void setPendingUtil(List<double> position) {
    _pendingPosition = List<double>.from(position);
    notifyListeners();
  }

  /// Stage a stand tap (setPositions mode). Shows the pending highlight.
  void setPendingStand(List<double> position) {
    _pendingPosition = List<double>.from(position);
    notifyListeners();
  }

  /// Move the pending pin to a new position (user tapped elsewhere).
  void movePending(List<double> position) {
    if (_pendingPosition == null) return;
    _pendingPosition = List<double>.from(position);
    notifyListeners();
  }

  /// Discard the pending pin without placing it.
  void cancelPending() {
    _pendingPosition = null;
    notifyListeners();
  }

  /// Confirm the pending position — actually places the util or stand.
  /// Returns false if there is no pending position.
  bool confirmPending({String? name, bool? status}) {
    if (_pendingPosition == null) return false;
    final pos = List<double>.from(_pendingPosition!);
    _pendingPosition = null;
    if (name != null && status != null) {
      placeUtil(name: name, status: status, position: pos);
    } else {
      placeStand(pos);
    }
    // placeUtil/placeStand already call notifyListeners
    return true;
  }

  // Completed utils in this session
  final List<TempUtil> _completedUtils = [];
  List<TempUtil> get completedUtils => List.unmodifiable(_completedUtils);
  int get completedCount => _completedUtils.length;

  // Util currently being placed (only non-null in setPositions mode)
  TempUtil? _activeUtil;
  TempUtil? get activeUtil => _activeUtil;

  // Undo/redo stacks for setUtil mode
  final List<TempUtil> _undoneUtils = [];

  // Undo/redo stacks for setPositions mode
  final List<List<double>> _undoneStands = [];

  // ----------------------------------------------------- setUtil actions --

  /// Tap on map in setUtil mode: places the util, switches to setPositions.
  /// Requires a util type to have been selected first.
  void placeUtil({
    required String name,
    required bool status,
    required List<double> position,
  }) {
    _activeUtil = TempUtil(name: name, status: status, position: position);
    _undoneStands.clear();
    _mode = CreatePinMode.setPositions;
    notifyListeners();
  }

  /// Done in setUtil mode: caller should show confirm dialog first.
  /// Call [finalizeSession] after confirmation.

  /// Cancel in setUtil mode: caller should show confirm dialog first.
  /// No state change needed; the caller navigates away.

  /// Undo in setUtil mode: removes the last completed util.
  void undoUtil() {
    if (_completedUtils.isEmpty) return;
    final removed = _completedUtils.removeLast();
    _undoneUtils.add(removed);
    notifyListeners();
  }

  /// Redo in setUtil mode: re-adds the last undone util.
  void redoUtil() {
    if (_undoneUtils.isEmpty) return;
    _completedUtils.add(_undoneUtils.removeLast());
    notifyListeners();
  }

  bool get canUndoUtil => _completedUtils.isNotEmpty;
  bool get canRedoUtil => _undoneUtils.isNotEmpty;

  // ------------------------------------------------- setPositions actions --

  /// Tap on map in setPositions mode: adds a stand to the active util.
  void placeStand(List<double> position) {
    if (_activeUtil == null) return;
    final updated = _activeUtil!.copyWith(
      stands: [..._activeUtil!.stands, position],
    );
    _activeUtil = updated;
    _undoneStands.clear();
    notifyListeners();
  }

  /// Done in setPositions mode: saves the active util, switches back to setUtil.
  /// Returns false if there are no stands (must have at least 1).
  bool donePositions() {
    if (_activeUtil == null) return false;
    if (_activeUtil!.stands.isEmpty) return false;

    _completedUtils.add(_activeUtil!);
    _undoneUtils.clear(); // new util committed — clear redo
    _activeUtil = null;
    _mode = CreatePinMode.setUtil;
    notifyListeners();
    return true;
  }

  /// Cancel in setPositions mode: discards the active util, switches back to setUtil.
  void cancelPositions() {
    _activeUtil = null;
    _mode = CreatePinMode.setUtil;
    notifyListeners();
  }

  /// Undo in setPositions mode: removes the last stand.
  void undoStand() {
    if (_activeUtil == null || _activeUtil!.stands.isEmpty) return;
    final stands = List<List<double>>.from(_activeUtil!.stands);
    final removed = stands.removeLast();
    _undoneStands.add(removed);
    _activeUtil = _activeUtil!.copyWith(stands: stands);
    notifyListeners();
  }

  /// Redo in setPositions mode: re-adds the last undone stand.
  void redoStand() {
    if (_undoneStands.isEmpty) return;
    final restored = _undoneStands.removeLast();
    _activeUtil = _activeUtil!.copyWith(
      stands: [..._activeUtil!.stands, restored],
    );
    notifyListeners();
  }

  bool get canUndoStand =>
      _activeUtil != null && _activeUtil!.stands.isNotEmpty;
  bool get canRedoStand => _undoneStands.isNotEmpty;

  bool get canAddStand =>
      _activeUtil != null && _activeUtil!.stands.length < 10;

  // ----------------------------------------------------------- finalize --

  /// Converts the completed session into a list of [UserUtilModel] ready to persist.
  List<UserUtilModel> finalizeSession({
    required String location,
    required String description,
    required String videoUrl,
  }) {
    final videoType = UserUtilModel.detectVideoType(videoUrl);
    return _completedUtils.asMap().entries.map((entry) {
      return UserUtilModel(
        id: '${DateTime.now().millisecondsSinceEpoch}_${entry.key}',
        location: location.toLowerCase(),
        description: description,
        name: entry.value.name,
        status: entry.value.status,
        position: entry.value.position,
        standPositions: entry.value.stands,
        videoUrl: videoUrl,
        videoType: videoType,
        createdAt: DateTime.now(),
      );
    }).toList();
  }

  // Get the first stand's InfoModel for navigation after saving
  UserUtilModel? get firstCompletedUtil =>
      _completedUtils.isNotEmpty ? null : null;

  bool get hasCompletedUtils => _completedUtils.isNotEmpty;
}
