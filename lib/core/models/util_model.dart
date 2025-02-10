import 'package:cs_smoke_app/core/models/info_model.dart';

class UtilModel {
  late String location;
  late String description;
  late String name;
  late bool status;
  late List<double> position;
  late List<InfoModel> stands;
  bool isSelected = false;

  UtilModel.fromJson(Map<String, dynamic> json) {
    location = json['location'] ?? '';
    description = json['description'] ?? '';
    name = json['name'] ?? '';
    status = json['status'] ?? false;
    position = List<double>.from(json['position'] ?? []);

    // Håndterer stands som en liste af InfoModel objekter
    stands = (json['stands'] as List<dynamic>? ?? [])
        .map((stand) => InfoModel.fromJson(stand as Map<String, dynamic>))
        .toList();
  }
}
