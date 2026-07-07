class SponsorModel {
  const SponsorModel({
    required this.id,
    required this.enabled,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.clickUrl,
    required this.ctaText,
    required this.apps,
    required this.weight,
    this.startsAt,
    this.endsAt,
  });

  final String id;
  final bool enabled;
  final String title;
  final String description;
  final String imageUrl;
  final String clickUrl;
  final String ctaText;
  final List<String> apps;
  final DateTime? startsAt;
  final DateTime? endsAt;
  final int weight;

  factory SponsorModel.fromJson(Map<String, dynamic> json) {
    return SponsorModel(
      id: json['id'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? false,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      clickUrl: json['clickUrl'] as String? ?? '',
      ctaText: json['ctaText'] as String? ?? 'Open',
      apps: (json['apps'] as List<dynamic>? ?? const [])
          .whereType<String>()
          .toList(),
      startsAt: _parseDate(json['startsAt']),
      endsAt: _parseDate(json['endsAt']),
      weight: json['weight'] is int ? json['weight'] as int : 1,
    );
  }

  Map<String, dynamic> toLogJson({
    required String placement,
    required String appId,
  }) {
    return {
      'placement': placement,
      'appId': appId,
      'id': id,
      'enabled': enabled,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'clickUrl': clickUrl,
      'ctaText': ctaText,
      'apps': apps,
      'startsAt': startsAt?.toIso8601String(),
      'endsAt': endsAt?.toIso8601String(),
      'weight': weight,
    };
  }

  bool isActiveForApp(String appId, DateTime now) {
    if (!enabled || id.isEmpty || title.isEmpty || clickUrl.isEmpty) {
      return false;
    }
    if (apps.isNotEmpty && !apps.contains(appId)) {
      return false;
    }
    if (startsAt != null && now.isBefore(_startOfDay(startsAt!))) {
      return false;
    }
    if (endsAt != null && now.isAfter(_endOfDay(endsAt!))) {
      return false;
    }
    return true;
  }

  static DateTime? _parseDate(dynamic value) {
    if (value == null) return null;
    if (value is! String || value.trim().isEmpty) return null;
    return DateTime.tryParse(value.trim());
  }

  static DateTime _startOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  static DateTime _endOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 23, 59, 59, 999);
  }
}

class SponsorFeed {
  const SponsorFeed({
    required this.version,
    required this.sponsors,
  });

  final int version;
  final List<SponsorModel> sponsors;

  factory SponsorFeed.fromJson(Map<String, dynamic> json) {
    final sponsorsJson = json['sponsors'];
    return SponsorFeed(
      version: json['version'] is int ? json['version'] as int : 1,
      sponsors: sponsorsJson is List
          ? sponsorsJson
              .whereType<Map<String, dynamic>>()
              .map(SponsorModel.fromJson)
              .toList()
          : const [],
    );
  }
}
