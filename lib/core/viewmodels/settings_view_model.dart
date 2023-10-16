import 'package:flutter/cupertino.dart';

class SettingsViewModel extends ChangeNotifier {
  bool _isNotification = true;
  bool get isNotification => _isNotification;

  void toggleNotification() {
    _isNotification = !_isNotification;
    notifyListeners();
  }
}
