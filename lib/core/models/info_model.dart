class InfoModel {
  late List<double> position;
  late String description;
  late String videoId;

  InfoModel.fromJson(Map<String, dynamic> json) {
    position = List<double>.from(json['position'] ?? []);
    description = json['description'] ?? '';
    videoId = json['videoId'] ?? '';
  }
}
