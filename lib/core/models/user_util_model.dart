import 'package:cs_smoke_app/core/models/enums.dart';
import 'package:cs_smoke_app/core/models/info_model.dart';
import 'package:cs_smoke_app/core/models/util_model.dart';

class UserUtilModel {
  final String id;
  final String location;
  final String description;
  final String name; // 'smoke' | 'flash' | 'molotov'
  final bool status; // false = CT, true = T
  final List<double> position;
  final List<List<double>> standPositions;
  final String videoUrl;
  final VideoType videoType;
  final DateTime createdAt;

  UserUtilModel({
    required this.id,
    required this.location,
    required this.description,
    required this.name,
    required this.status,
    required this.position,
    required this.standPositions,
    required this.videoUrl,
    required this.videoType,
    required this.createdAt,
  });

  /// Detects the video platform from a URL.
  static VideoType detectVideoType(String url) {
    final lower = url.toLowerCase();
    if (lower.contains('youtube.com') || lower.contains('youtu.be')) {
      return VideoType.youtube;
    } else if (lower.contains('instagram.com')) {
      return VideoType.instagram;
    } else if (lower.contains('tiktok.com')) {
      return VideoType.tiktok;
    }
    return VideoType.other;
  }

  /// Tries to extract a YouTube video ID from a URL.
  /// Returns null if the URL is not a YouTube link or ID cannot be parsed.
  static String? extractYoutubeId(String url) {
    // youtu.be/<id>
    final shortMatch = RegExp(r'youtu\.be/([a-zA-Z0-9_-]{11})').firstMatch(url);
    if (shortMatch != null) return shortMatch.group(1);

    // youtube.com/watch?v=<id>
    final watchMatch = RegExp(r'[?&]v=([a-zA-Z0-9_-]{11})').firstMatch(url);
    if (watchMatch != null) return watchMatch.group(1);

    // youtube.com/shorts/<id>
    final shortsMatch = RegExp(r'shorts/([a-zA-Z0-9_-]{11})').firstMatch(url);
    if (shortsMatch != null) return shortsMatch.group(1);

    // youtube.com/embed/<id>
    final embedMatch = RegExp(r'embed/([a-zA-Z0-9_-]{11})').firstMatch(url);
    if (embedMatch != null) return embedMatch.group(1);

    return null;
  }

  /// Converts this user util to a UtilModel for rendering on the radar.
  /// Each stand gets an InfoModel with isUserCreated=true for use in InfoScreen.
  UtilModel toUtilModel() {
    final youtubeId = extractYoutubeId(videoUrl) ?? '';
    final stands = standPositions.asMap().entries.map((entry) {
      return InfoModel(
        position: entry.value,
        description: '',
        videoId: youtubeId,
        videoUrl: videoType == VideoType.youtube ? null : videoUrl,
        isUserCreated: true,
        userUtilId: id,
        standIndex: entry.key,
      );
    }).toList();

    return UtilModel(
      location: location,
      description: description,
      name: name,
      status: status,
      position: position,
      stands: stands,
    );
  }

  factory UserUtilModel.fromJson(Map<String, dynamic> json) {
    final rawStands = json['standPositions'] as List<dynamic>? ?? [];
    final stands = rawStands
        .map((s) => List<double>.from(s as List<dynamic>))
        .toList();

    return UserUtilModel(
      id: json['id'] as String,
      location: json['location'] as String,
      description: json['description'] as String? ?? '',
      name: json['name'] as String,
      status: json['status'] as bool? ?? false,
      position: List<double>.from(json['position'] as List<dynamic>),
      standPositions: stands,
      videoUrl: json['videoUrl'] as String,
      videoType: VideoType.values.firstWhere(
        (e) => e.name == json['videoType'],
        orElse: () => VideoType.other,
      ),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'location': location,
      'description': description,
      'name': name,
      'status': status,
      'position': position,
      'standPositions': standPositions,
      'videoUrl': videoUrl,
      'videoType': videoType.name,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
