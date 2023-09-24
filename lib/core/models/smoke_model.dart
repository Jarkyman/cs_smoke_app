class Smoke {
  late String location;
  late String description;
  late String name;
  late bool status;
  late List<double> position;
  late List<List<double>> stands;
  late int tile;
  bool isSelected = false;

  Smoke.fromMap(Map data) {
    this.location = data['location'] ?? '';
    this.description = data['description'] ?? '';
    this.name = data['name'] ?? '';
    this.status = data['status'] ?? false;
    this.position = data['position'] ?? [0.0];
    this.stands = data['stands'] ?? [];
    this.tile = data['tile'] ?? 0;
  }
}
