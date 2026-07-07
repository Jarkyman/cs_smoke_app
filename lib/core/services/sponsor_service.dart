import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/sponsor_model.dart';

class SponsorService {
  SponsorService({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  static const String defaultFeedUrl =
      'https://gist.githubusercontent.com/Jarkyman/3b644c2c8fa4766ee646d31bef30a364/raw/sponsors.json';
  static const String cacheKey = 'cached_sponsor_feed';
  static const String feedUrlEnvKey = 'SPONSOR_FEED_URL';

  String get feedUrl {
    final configuredUrl = _dotenvValue(feedUrlEnvKey)?.trim();
    if (configuredUrl != null && configuredUrl.isNotEmpty) {
      return configuredUrl;
    }
    return defaultFeedUrl;
  }

  Future<SponsorFeed> loadFeed() async {
    final remoteFeed = await _fetchRemoteFeed();
    if (remoteFeed != null) {
      return remoteFeed;
    }

    final cachedFeed = await _loadCachedFeed();
    if (cachedFeed != null) {
      return cachedFeed;
    }

    return const SponsorFeed(version: 1, sponsors: []);
  }

  Future<SponsorFeed?> _fetchRemoteFeed() async {
    try {
      final response = await _client
          .get(Uri.parse(feedUrl))
          .timeout(const Duration(seconds: 20));

      if (response.statusCode != 200) {
        debugPrint('Sponsor feed failed: HTTP ${response.statusCode}');
        return null;
      }

      final feed = _parseFeed(response.body);
      debugPrint(
        'Sponsor feed loaded: {"url":"$feedUrl","version":${feed.version},"sponsorCount":${feed.sponsors.length}}',
      );
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(cacheKey, response.body);
      return feed;
    } catch (e) {
      debugPrint('Sponsor feed fetch failed: $e');
      return null;
    }
  }

  Future<SponsorFeed?> _loadCachedFeed() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedJson = prefs.getString(cacheKey);
    if (cachedJson == null || cachedJson.isEmpty) {
      return null;
    }

    try {
      return _parseFeed(cachedJson);
    } catch (e) {
      debugPrint('Sponsor feed cache parse failed: $e');
      return null;
    }
  }

  SponsorFeed _parseFeed(String jsonString) {
    final data = jsonDecode(jsonString);
    if (data is! Map<String, dynamic>) {
      throw const FormatException('Sponsor feed must be a JSON object');
    }
    return SponsorFeed.fromJson(data);
  }

  String? _dotenvValue(String key) {
    try {
      return dotenv.env[key];
    } catch (_) {
      return null;
    }
  }
}
