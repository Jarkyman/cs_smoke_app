import 'package:cs_smoke_app/core/models/info_model.dart';

class Smoke {
  late String location;
  late String description;
  late String name;
  late bool status;
  late List<double> position;
  late List<InfoModel> stands;
  bool isSelected = false;

  Smoke.fromMap(Map data) {
    this.location = data['location'] ?? '';
    this.description = data['description'] ?? '';
    this.name = data['name'] ?? '';
    this.status = data['status'] ?? false;
    this.position = List<double>.from(data['position'] ?? [0.0]);

    List<Map> standsData = data['stands'] ?? [];
    this.stands =
        standsData.map((standData) => InfoModel.fromMap(standData)).toList();
  }
}
