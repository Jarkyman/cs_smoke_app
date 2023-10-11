import 'package:flutter/cupertino.dart';

import '../../view/shared/global.dart';
import '../models/util_model.dart';

class UtilViewModel extends ChangeNotifier {
  bool _isUtilSelected = false;
  bool get isUtilSelected => _isUtilSelected;

  UtilModel? _selectedUtil;
  UtilModel? get selectedUtil => _selectedUtil;

  bool _isT = true;
  bool get isT => _isT;

  bool _isCt = false;
  bool get isCt => _isCt;

  String _util = 'smoke';
  String get util => _util;

  bool _isSmokeT = true;
  bool get isSmokeT => _isSmokeT;
  bool _isSmokeCt = false;
  bool get isSmokeCt => _isSmokeCt;
  bool _isFlashT = false;
  bool get isFlashT => _isFlashT;
  bool _isFlashCt = false;
  bool get isFlashCt => _isFlashCt;
  bool _isMolotovT = false;
  bool get isMolotovT => _isMolotovT;
  bool _isMolotovCt = false;
  bool get isMolotovCt => _isMolotovCt;

  final List<UtilModel> _utils =
      Global.allUtils.map((item) => UtilModel.fromMap(item)).toList();
  List<UtilModel> get utils => _utils;

  void toggleUtil(String utilName) {
    _isSmokeT = false;
    _isSmokeCt = false;
    _isFlashT = false;
    _isFlashCt = false;
    _isMolotovT = false;
    _isMolotovCt = false;
    _isCt = false;
    _isT = false;

    switch (utilName) {
      case 'smokeT':
        _isSmokeT = true;
        _isT = true;
        _util = 'smoke';
        break;
      case 'smokeCt':
        _isSmokeCt = true;
        _isCt = true;
        _util = 'smoke';
        break;
      case 'flashT':
        _isFlashT = true;
        _isT = true;
        _util = 'flash';
        break;
      case 'flashCt':
        _isFlashCt = true;
        _isCt = true;
        _util = 'flash';
        break;
      case 'molotovT':
        _isMolotovT = true;
        _isT = true;
        _util = 'molotov';
        break;
      case 'molotovCt':
        _isMolotovCt = true;
        _isCt = true;
        _util = 'molotov';
        break;
    }
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
    notifyListeners();
  }
}
