class InfoModel {
  late List<double> position;
  late String description;
  late String videoId;

  InfoModel.fromMap(Map data) {
    this.position = data['position'] ?? [0.0];
    this.description = data['description'] ?? '';
    this.videoId = data['videoId'] ?? '';
  }
}
