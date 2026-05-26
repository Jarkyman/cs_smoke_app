class InfoModel {
  final List<double> position;
  final String description;
  final String videoId;

  InfoModel({
    required this.position,
    required this.description,
    required this.videoId,
  });

  factory InfoModel.fromJson(Map<String, dynamic> json) {
    List<double> parsedPosition = List<double>.from(json['position'] ?? []);
    if (parsedPosition.length < 2) {
      parsedPosition = [0.0, 0.0];
    }

    return InfoModel(
      position: parsedPosition,
      description: json['description'] ?? '',
      videoId: json['videoId'] ?? '',
    );
  }
}
