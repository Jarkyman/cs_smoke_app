import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/sponsor_model.dart';
import '../services/sponsor_service.dart';

class SponsorViewModel extends ChangeNotifier {
  SponsorViewModel({
    SponsorService? sponsorService,
    Random? random,
  })  : _sponsorService = sponsorService ?? SponsorService(),
        _random = random ?? Random();

  final SponsorService _sponsorService;
  final Random _random;

  static const String defaultAppId = 'util_master';
  static const String appIdEnvKey = 'SPONSOR_APP_ID';
  static const String videoAdSlotCountKey = 'sponsor_video_ad_slot_count';
  static const double startupChance = 0.1;
  static const int videoSponsorFrequency = 2;

  Future<void>? _loadFuture;
  List<SponsorModel> _sponsors = [];

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  String get appId {
    final configuredAppId = _dotenvValue(appIdEnvKey)?.trim();
    if (configuredAppId != null && configuredAppId.isNotEmpty) {
      return configuredAppId;
    }
    return defaultAppId;
  }

  Future<void> loadSponsors() {
    _loadFuture ??= _loadSponsors();
    return _loadFuture!;
  }

  Future<SponsorModel?> pickStartupSponsor() async {
    await loadSponsors();

    if (_random.nextDouble() >= startupChance) {
      return null;
    }
    return _pickActiveSponsor();
  }

  Future<SponsorModel?> pickVideoSponsorForAdSlot() async {
    await loadSponsors();

    final prefs = await SharedPreferences.getInstance();
    final count = (prefs.getInt(videoAdSlotCountKey) ?? 0) + 1;
    await prefs.setInt(videoAdSlotCountKey, count);

    if (count % videoSponsorFrequency != 0) {
      return null;
    }

    return _pickActiveSponsor();
  }

  Future<void> _loadSponsors() async {
    final feed = await _sponsorService.loadFeed();
    _sponsors = feed.sponsors;
    _isLoaded = true;
    notifyListeners();
  }

  SponsorModel? _pickActiveSponsor() {
    final now = DateTime.now();
    final activeSponsors = _sponsors
        .where((sponsor) => sponsor.isActiveForApp(appId, now))
        .toList();

    if (activeSponsors.isEmpty) {
      return null;
    }

    final totalWeight = activeSponsors.fold<int>(
      0,
      (sum, sponsor) => sum + max(1, sponsor.weight),
    );
    var selectedWeight = _random.nextInt(totalWeight);

    for (final sponsor in activeSponsors) {
      selectedWeight -= max(1, sponsor.weight);
      if (selectedWeight < 0) {
        return sponsor;
      }
    }

    return activeSponsors.first;
  }

  String? _dotenvValue(String key) {
    try {
      return dotenv.env[key];
    } catch (_) {
      return null;
    }
  }
}
