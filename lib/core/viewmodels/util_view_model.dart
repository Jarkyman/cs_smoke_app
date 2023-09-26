import 'package:flutter/cupertino.dart';

import '../../view/shared/global.dart';
import '../models/smoke_model.dart';

class UtilViewModel extends ChangeNotifier {
  bool _isUtilSelected = false;
  bool get isUtilSelected => _isUtilSelected;

  Smoke? _selectedUtil;
  Smoke? get selectedUtil => _selectedUtil;

  bool _isSmokeT = false;
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

  final List<Smoke> _smokes =
      Global.smokes.map((item) => Smoke.fromMap(item)).toList();
  List<Smoke> get smokes => _smokes;

  void toggleUtil(String utilName) {
    switch (utilName) {
      case 'smokeT':
        _isSmokeT = !_isSmokeT;
        break;
      case 'smokeCt':
        _isSmokeCt = !_isSmokeCt;
        break;
      case 'flashT':
        _isFlashT = !_isFlashT;
        break;
      case 'flashCt':
        _isFlashCt = !_isFlashCt;
        break;
      case 'molotovT':
        _isMolotovT = !_isMolotovT;
        break;
      case 'molotovCt':
        _isMolotovCt = !_isMolotovCt;
        break;
    }
  }

  void selectUtil(Smoke util) {
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
