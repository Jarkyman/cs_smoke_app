import 'package:cs_smoke_app/core/models/info_model.dart';

class UtilModel {
  final String location;
  final String description;
  final String name;
  final bool status;
  final List<double> position;
  final List<InfoModel> stands;

  UtilModel({
    required this.location,
    required this.description,
    required this.name,
    required this.status,
    required this.position,
    required this.stands,
  });

  factory UtilModel.fromJson(Map<String, dynamic> json) {
    List<double> parsedPosition = List<double>.from(json['position'] ?? []);
    if (parsedPosition.length < 2) {
      parsedPosition = [0.0, 0.0];
    }

    return UtilModel(
      location: json['location'] ?? '',
      description: json['description'] ?? '',
      name: json['name'] ?? '',
      status: json['status'] ?? false,
      position: parsedPosition,
      stands: (json['stands'] as List<dynamic>? ?? [])
          .map((stand) => InfoModel.fromJson(stand as Map<String, dynamic>))
          .toList(),
    );
  }
}
