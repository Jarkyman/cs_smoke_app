import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cs_smoke_app/core/models/util_model.dart'; // Importer UtilModel
import 'package:flutter/foundation.dart';


class JsonDataHandler {
  //static const String url = 'https://hartvigsolutions.com/mapdata.json';
  static const String url = 'https://gist.githubusercontent.com/Jarkyman/d3cba4afc8948b1a78a6373d7667f230/raw/mapdata.json';
  static const String storageKey = 'cached_utility_data';

  // Hent JSON-data fra URL og gem det i SharedPreferences
  Future<bool> fetchAndSaveData() async {
    debugPrint("Fetching data");
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(storageKey, response.body);
        return true;
      } else {
        throw Exception('Fejl ved hentning af data');
      }
    } catch (e) {
      debugPrint('Fejl: $e');
      return false;
    }
  }

  Future<List<UtilModel>> loadData({int retryCount = 0}) async {
    debugPrint("Loading data");
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(storageKey);

    if (jsonString != null) {
      final Map<String, dynamic> jsonData = jsonDecode(jsonString); // decode as Map

      if (jsonData.containsKey("allUtils") && jsonData["allUtils"] is List) {
        // Safe casting of the List<dynamic> into List<Map<String, dynamic>> for proper mapping
        List<dynamic> allUtilsList = jsonData["allUtils"];

        // Map each item in the list to UtilModel using the 'fromJson' method
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
    } else {
      if (retryCount >= 1) {
        debugPrint("Kunne ikke hente data, returnerer tom liste");
        return [];
      }

      bool success = await fetchAndSaveData();
      if (success) {
        return loadData(retryCount: retryCount + 1); // Prøv igen efter succesfuld hentning
      } else {
        return []; // Returner en tom liste, hvis fetch fejler
      }
    }
  }


}
