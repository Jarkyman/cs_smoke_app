import 'package:flutter/cupertino.dart';

import '../../view/shared/global.dart';
import '../models/smoke_model.dart';

class UtilViewModel extends ChangeNotifier {
  bool _isUtilSelected = false;
  bool get isUtilSelected => _isUtilSelected;

  Smoke? _selectedUtil;
  Smoke? get selectedUtil => _selectedUtil;

  final List<Smoke> _smokes =
      Global.smokes.map((item) => Smoke.fromMap(item)).toList();
  List<Smoke> get smokes => _smokes;

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
