import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/notification_api.dart';

class SettingsViewModel extends ChangeNotifier {
  SettingsViewModel() {
    loadSettings();
    checkPermission();
  }

  bool _isNotification = true;
  bool get isNotification => _isNotification;
  String _notificationKey = 'notification';

  Future<void> loadSettings() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _isNotification = prefs.getBool(_notificationKey) ?? true;
    if (!_isNotification) {
      NotificationApi.cancelAll();
    }
    print('Load: $_isNotification');
  }

  void saveSettings() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print('Save: $_isNotification');
    await prefs.setBool(_notificationKey, _isNotification);
  }

  void toggleNotification() async {
    var status = await Permission.notification.status;
    if (_isNotification) {
      print('off');
      _isNotification = false;
      NotificationApi.cancelAll();
      saveSettings();
    } else {
      if (status.isGranted) {
        print('on');
        _isNotification = true;
        saveSettings();
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
      NotificationApi.cancelAll();
      saveSettings();
      notifyListeners();
    }

    if (await Permission.notification.isRestricted) {
      print('premission Restrcted');
      _isNotification = false;
      NotificationApi.cancelAll();
      saveSettings();
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
      NotificationApi.cancelAll();
      saveSettings();
      notifyListeners();
    }
  }
}
