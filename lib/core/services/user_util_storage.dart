import 'dart:convert';
import 'dart:io';

import 'package:cs_smoke_app/core/models/user_util_model.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserUtilStorage {
  static const String _prefsKey = 'user_utils';
  static const String _fileName = 'user_utils.json';

  // ------------------------------------------------------------------ read --
  Future<List<UserUtilModel>> loadUserUtils() async {
    try {
      final raw = await _readRaw();
      if (raw == null || raw.isEmpty) return [];
      final decoded = jsonDecode(raw) as Map<String, dynamic>;
      final list = decoded['userUtils'] as List<dynamic>? ?? [];
      return list
          .map((e) => UserUtilModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      debugPrint('UserUtilStorage.loadUserUtils error: $e');
      return [];
    }
  }

  // ----------------------------------------------------------------- write --
  Future<void> saveUserUtils(List<UserUtilModel> utils) async {
    try {
      final payload = jsonEncode({
        'userUtils': utils.map((u) => u.toJson()).toList(),
      });
      await _writeRaw(payload);
    } catch (e) {
      debugPrint('UserUtilStorage.saveUserUtils error: $e');
    }
  }

  // --------------------------------------------------------------- helpers --
  Future<String?> _readRaw() async {
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_prefsKey);
    } else {
      final file = await _localFile;
      if (!await file.exists()) return null;
      return file.readAsString();
    }
  }

  Future<void> _writeRaw(String data) async {
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_prefsKey, data);
    } else {
      final file = await _localFile;
      await file.writeAsString(data);
    }
  }

  Future<File> get _localFile async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/$_fileName');
  }
}
