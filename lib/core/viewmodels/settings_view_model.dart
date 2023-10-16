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
    if (_isNotification) {
      print('off');
      _isNotification = false;
    } else {
      if (status.isGranted) {
        print('on');
        _isNotification = true;
      } else {
        print('Not granted');
        askPermission();
      }
    }
    notifyListeners();
  }

  void checkPermission() async {
    var status = await Permission.notification.status;
    print(status);
    if (status.isGranted) {
      print('premission On');
    } else {
      print('premission OFF');
      _isNotification = false;
      notifyListeners();
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
    } else if (await Permission.notification.isPermanentlyDenied) {
      print('Open premission setting');
      openAppSettings();
    } else {
      print('No premission');
      _isNotification = false;
      notifyListeners();
    }
  }
}
