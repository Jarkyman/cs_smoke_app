import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cs_smoke_app/core/models/util_model.dart';
import 'package:flutter/foundation.dart';
import 'package:universal_io/io.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class JsonDataHandler {
  static String get url => dotenv.env['MAP_DATA_URL'] ?? 'https://gist.githubusercontent.com/Jarkyman/d3cba4afc8948b1a78a6373d7667f230/raw/mapdata.json';
  static const String storageKey = 'cached_utility_data';
  static const String timestampKey = 'cached_utility_data_timestamp';
  static const String fileName = 'cached_utility_data.json';

  Future<File> get _localFile async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$fileName');
  }

  Future<bool> _isCacheValid() async {
    final prefs = await SharedPreferences.getInstance();
    final lastFetchMs = prefs.getInt(timestampKey);
    if (lastFetchMs == null) return false;

    final lastFetch = DateTime.fromMillisecondsSinceEpoch(lastFetchMs);
    final now = DateTime.now();
    final difference = now.difference(lastFetch);
    
    // Udløber efter 48 timer
    return difference.inHours < 48;
  }

  Future<void> _updateTimestamp() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(timestampKey, DateTime.now().millisecondsSinceEpoch);
  }

  Future<void> _saveData(String jsonData) async {
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(storageKey, jsonData);
    } else {
      final file = await _localFile;
      await file.writeAsString(jsonData);
    }
    await _updateTimestamp();
  }

  Future<String?> _loadCachedData() async {
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(storageKey);
    } else {
      try {
        final file = await _localFile;
        if (await file.exists()) {
          return await file.readAsString();
        }
      } catch (e) {
        debugPrint("Error reading cached file: $e");
      }
    }
    return null;
  }

  Future<bool> fetchAndSaveData() async {
    debugPrint("Fetching data from network...");
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        await _saveData(response.body);
        return true;
      } else {
        throw Exception('Fejl ved hentning af data');
      }
    } catch (e) {
      debugPrint('Fejl under fetchAndSaveData: $e');
      return false;
    }
  }

  Future<List<UtilModel>> loadData({int retryCount = 0}) async {
    debugPrint("Loading data (retry: $retryCount)");
    
    final bool cacheValid = await _isCacheValid();
    String? jsonString;

    if (!cacheValid) {
      debugPrint("Cache is invalid/expired. Fetching new data.");
      bool success = await fetchAndSaveData();
      if (!success) {
        debugPrint("Fetch failed, attempting to fallback to stale cache.");
      }
    }

    jsonString = await _loadCachedData();

    if (jsonString != null && jsonString.isNotEmpty) {
      try {
        final Map<String, dynamic> jsonData = jsonDecode(jsonString);

        if (jsonData.containsKey("allUtils") && jsonData["allUtils"] is List) {
          List<dynamic> allUtilsList = jsonData["allUtils"];
          return allUtilsList.map((utilData) {
            if (utilData is Map<String, dynamic>) {
              return UtilModel.fromJson(utilData);
            } else {
              throw Exception("Fejl: Forkert format i 'allUtils' element");
            }
          }).toList();
        } else {
          throw Exception("Fejl: JSON-strukturen er forkert");
        }
      } catch (e) {
        debugPrint("Parse error: $e");
        // Hvis parsing af cachen fejler, slet den og prøv at hente igen
        if (retryCount < 1) {
          await fetchAndSaveData();
          return loadData(retryCount: retryCount + 1);
        }
        return [];
      }
    } else {
      if (retryCount >= 1) {
        debugPrint("Kunne ikke hente data, returnerer tom liste");
        return [];
      }
      
      bool success = await fetchAndSaveData();
      if (success) {
        return loadData(retryCount: retryCount + 1);
      } else {
        return [];
      }
    }
  }
}
