import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cs_smoke_app/core/models/util_model.dart'; // Importer UtilModel

class JsonDataHandler {
  //static const String url = 'https://hartvigsolutions.com/mapdata.json';
  static const String url = 'https://gist.githubusercontent.com/Jarkyman/d3cba4afc8948b1a78a6373d7667f230/raw/mapdata.json';
  static const String storageKey = 'cached_utility_data';

  // Hent JSON-data fra URL og gem det i SharedPreferences
  Future<void> fetchAndSaveData() async {
    print("Fetching data");
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(storageKey, response.body);
      } else {
        throw Exception('Fejl ved hentning af data');
      }
    } catch (e) {
      print('Fejl: $e');
    }
  }

  Future<List<UtilModel>> loadData() async {
    print("Loading data");
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
      await fetchAndSaveData();
      return loadData(); // Prøv igen efter at have hentet
    }
  }


}
