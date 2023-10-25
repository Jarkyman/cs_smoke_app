import 'dart:developer';

import 'package:cs_smoke_app/core/helper/constants.dart';
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

  Future<void> loadSettings() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _isNotification = prefs.getBool(Constants.NOTIFICATION_KEY) ?? true;
    if (!_isNotification) {
      NotificationApi.cancelAll();
    }
    log('Notifications load: $_isNotification');
  }

  void saveSettings() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    log('Notifications save: $_isNotification');
    await prefs.setBool(Constants.NOTIFICATION_KEY, _isNotification);
  }

  void toggleNotification() async {
    var status = await Permission.notification.status;
    if (_isNotification) {
      log('Notifications off');
      _isNotification = false;
      NotificationApi.cancelAll();
      saveSettings();
    } else {
      if (status.isGranted) {
        log('Notifications on');
        _isNotification = true;
        saveSettings();
      } else {
        log('Notifications not granted');
        askPermission();
      }
    }
    notifyListeners();
  }

  void checkPermission() async {
    PermissionStatus status = await Permission.notification.status;
    log(status.toString());
    if (status.isGranted) {
      log('Notifications premission On');
    } else {
      log('Notifications premission OFF');
      _isNotification = false;
      NotificationApi.cancelAll();
      saveSettings();
      notifyListeners();
    }

    if (await Permission.notification.isRestricted) {
      log('Notifications premission Restrcted');
      _isNotification = false;
      NotificationApi.cancelAll();
      saveSettings();
      notifyListeners();
    }
  }

  void askPermission() async {
    if (await Permission.notification.request().isGranted) {
      log('Notifications get premission');
    } else if (await Permission.notification.isPermanentlyDenied) {
      log('Notifications open premission setting');
      openAppSettings();
    } else {
      log('Notifications no premission');
      _isNotification = false;
      NotificationApi.cancelAll();
      saveSettings();
      notifyListeners();
    }
  }
}
