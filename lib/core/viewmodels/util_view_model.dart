import 'package:cs_smoke_app/core/helper/json_data_handler.dart';
import 'package:flutter/cupertino.dart';

import '../models/util_model.dart';
import '../models/enums.dart';

class UtilViewModel extends ChangeNotifier {
  final JsonDataHandler _jsonDataHandler;

  UtilViewModel({JsonDataHandler? jsonDataHandler}) 
      : _jsonDataHandler = jsonDataHandler ?? JsonDataHandler();

  ViewState _state = ViewState.idle;
  ViewState get state => _state;

  bool _isUtilSelected = false;
  bool get isUtilSelected => _isUtilSelected;

  bool _showNames = false;
  bool get showNames => _showNames;

  UtilModel? _selectedUtil;
  UtilModel? get selectedUtil => _selectedUtil;

  Team _selectedTeam = Team.t;
  Team get selectedTeam => _selectedTeam;

  UtilType _selectedType = UtilType.smoke;
  UtilType get selectedType => _selectedType;

  List<UtilModel> _utils = [];
  List<UtilModel> get utils => _utils;

  // Helpers for backward compatibility where needed
  bool get isT => _selectedTeam == Team.t;
  bool get isCt => _selectedTeam == Team.ct;
  String get util => _selectedType.name; // 'smoke', 'flash', 'molotov'

  Future<void> loadData() async {
    if (_utils.isEmpty) {
      _state = ViewState.loading;
      notifyListeners();
      
      try {
        _utils = await _jsonDataHandler.loadData();
        _state = ViewState.success;
      } catch (e) {
        _state = ViewState.error;
      }
      notifyListeners();
    }
  }

  void toggleShowName() {
    _showNames = !_showNames;
    notifyListeners();
  }

  bool isUtilTypeSelected(UtilType type, Team team) {
    return _selectedType == type && _selectedTeam == team;
  }

  void toggleUtil(UtilType type, Team team) {
    _selectedType = type;
    _selectedTeam = team;

    _isUtilSelected = false;
    _selectedUtil = null;
    notifyListeners();
  }

  void selectUtil(UtilModel util) {
    _isUtilSelected = true;
    _selectedUtil = util;
    notifyListeners();
  }

  void reset() {
    _isUtilSelected = false;
    _selectedUtil = null;
    _showNames = false;
    notifyListeners();
  }
}
