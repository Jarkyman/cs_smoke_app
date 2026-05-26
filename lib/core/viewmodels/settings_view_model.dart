import 'dart:developer';

import 'package:cs_smoke_app/core/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

import '../helper/notification_api.dart';

class SettingsViewModel extends ChangeNotifier {
  SettingsViewModel() {
    _init();
  }

  Future<void> _init() async {
    await loadSettings();
    await checkPermission();
  }

  bool _isNotification = true;
  bool get isNotification => _isNotification;

  Locale? _locale;
  Locale? get locale => _locale;

  Future<void> loadSettings() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _isNotification = prefs.getBool(Constants.notificationKey) ?? true;
    
    final savedLang = prefs.getString(Constants.languageKey);
    if (savedLang != null && savedLang.isNotEmpty) {
      _locale = Locale(savedLang);
    } else {
      final systemLocale = Platform.localeName.split('_')[0];
      _locale = Locale(systemLocale);
    }

    if (!_isNotification) {
      NotificationApi.cancelAll();
    }
    log('Notifications load: $_isNotification, Locale: ${_locale?.languageCode}');
  }

  Future<void> saveSettings() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    log('Notifications save: $_isNotification');
    await prefs.setBool(Constants.notificationKey, _isNotification);
    if (_locale != null) {
      await prefs.setString(Constants.languageKey, _locale!.languageCode);
    }
  }

  Future<void> setLocale(Locale newLocale) async {
    _locale = newLocale;
    notifyListeners();
    await saveSettings();
  }

  Future<void> toggleNotification() async {
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

  Future<void> checkPermission() async {
    PermissionStatus status = await Permission.notification.status;
    log(status.toString());
    if (status.isGranted) {
      log('Notifications permission On');
    } else {
      log('Notifications permission OFF');
      _isNotification = false;
      NotificationApi.cancelAll();
      saveSettings();
      notifyListeners();
    }

    if (await Permission.notification.isRestricted) {
      log('Notifications permission Restricted');
      _isNotification = false;
      NotificationApi.cancelAll();
      saveSettings();
      notifyListeners();
    }
  }

  Future<void> askPermission() async {
    if (await Permission.notification.request().isGranted) {
      log('Notifications get permission');
    } else if (await Permission.notification.isPermanentlyDenied) {
      log('Notifications open permission setting');
      openAppSettings();
    } else {
      log('Notifications no permission');
      _isNotification = false;
      NotificationApi.cancelAll();
      saveSettings();
      notifyListeners();
    }
  }
}
