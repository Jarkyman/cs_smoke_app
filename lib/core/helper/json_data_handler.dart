import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cs_smoke_app/core/models/util_model.dart';
import 'package:flutter/foundation.dart';
import 'package:universal_io/io.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class JsonDataHandler {
  static String get url => dotenv.env['MAP_DATA_URL'] ?? '';
  static const String storageKey = 'cached_utility_data';
  static const String timestampKey = 'cached_utility_data_timestamp';
  static const String etagKey = 'cached_utility_data_etag';
  static const String lastModifiedKey = 'cached_utility_data_last_modified';
  static const String fileName = 'cached_utility_data.json';

  Future<File> get _localFile async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$fileName');
  }

  // Cache valid logic removed because we now use ETag to check for changes efficiently on every load

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

  Future<bool> fetchAndSaveData({http.Client? client}) async {
    final httpClient = client ?? http.Client();
    debugPrint("Fetching data from network...");
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedEtag = prefs.getString(etagKey);
      final savedLastModified = prefs.getString(lastModifiedKey);

      Map<String, String> headers = {};
      if (savedEtag != null) {
        headers['If-None-Match'] = savedEtag;
      }
      if (savedLastModified != null) {
        headers['If-Modified-Since'] = savedLastModified;
      }

      final response = await httpClient.get(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: 20));

      if (response.statusCode == 200) {
        debugPrint("New data downloaded!");

        // Save new headers for next time
        final newEtag = response.headers['etag'];
        final newLastModified = response.headers['last-modified'];
        if (newEtag != null) await prefs.setString(etagKey, newEtag);
        if (newLastModified != null) {
          await prefs.setString(lastModifiedKey, newLastModified);
        }

        await _saveData(response.body);
        // Cleanup if we created the client
        if (client == null) {
          httpClient.close();
        }
        return true;
      } else if (response.statusCode == 304) {
        debugPrint("Data hasn't changed on server (304 Not Modified). Using cache.");
        // Data hasn't changed, but we still update our local timestamp so we reset the 48h timer
        await _updateTimestamp();
        
        if (client == null) httpClient.close();
        return true;
      } else {
        if (client == null) httpClient.close();
        throw Exception('Error fetching data: HTTP ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error in fetchAndSaveData: $e');
      return false;
    }
  }

  Future<List<UtilModel>> loadData({int retryCount = 0, http.Client? client}) async {
    debugPrint("Loading data (retry: $retryCount)");

    // Always check for updates (uses ETag, so it's super fast if unchanged)
    bool success = await fetchAndSaveData(client: client);
    if (!success) {
      debugPrint(
          "Fetch failed or no connection, attempting to fallback to local cache.");
    }

    String? jsonString = await _loadCachedData();

    if (jsonString != null && jsonString.isNotEmpty) {
      try {
        final Map<String, dynamic> jsonData = jsonDecode(jsonString);

        if (jsonData.containsKey("allUtils") && jsonData["allUtils"] is List) {
          List<dynamic> allUtilsList = jsonData["allUtils"];
          return allUtilsList.map((utilData) {
            if (utilData is Map<String, dynamic>) {
              return UtilModel.fromJson(utilData);
            } else {
              throw Exception("Error: Incorrect format in 'allUtils' element");
            }
          }).toList();
        } else {
          throw Exception("Error: Incorrect JSON structure");
        }
      } catch (e) {
        debugPrint("Parse error: $e");
        // If parsing the cache fails, try fetching again
        if (retryCount < 1) {
          await fetchAndSaveData(client: client);
          return loadData(retryCount: retryCount + 1, client: client);
        }
        return [];
      }
    } else {
      if (retryCount >= 1) {
        debugPrint("Could not fetch data, returning empty list");
        return [];
      }

      bool success = await fetchAndSaveData(client: client);
      if (success) {
        return loadData(retryCount: retryCount + 1, client: client);
      } else {
        return [];
      }
    }
  }
}
