import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class SettingsViewModel extends ChangeNotifier {
  SettingsViewModel() {
    checkPermission();
  }

  bool _isNotification = true;
  bool get isNotification => _isNotification;

  void toggleNotification() async {
    var status = await Permission.notification.status;
    if (status.isDenied) {
      askPermission();
    }
    _isNotification = !_isNotification;
    notifyListeners();
  }

  void checkPermission() async {
    var status = await Permission.notification.status;
    if (status.isDenied) {
      print('premission OFF');
      _isNotification = false;
      notifyListeners();
    } else {
      print('premission On');
    }

    if (await Permission.notification.isRestricted) {
      print('premission Restrcted');
      _isNotification = false;
      notifyListeners();
    }
  }

  void askPermission() async {
    if (await Permission.notification.request().isGranted) {
      print('Get premission');
    } else if (await Permission.speech.isPermanentlyDenied) {
      print('Open premission setting');
      openAppSettings();
    } else {
      print('No premission');
      _isNotification = false;
      notifyListeners();
    }
  }
}
