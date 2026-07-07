import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

/// Centralized analytics service for Util Master.
///
/// All custom events are tracked here to keep analytics logic out of UI code.
/// Event names and parameter keys follow Firebase's snake_case convention.
///
/// Default noise events (user_engagement, screen_view, session_start) are
/// best filtered in the Firebase Console under Events → Manage definitions,
/// or excluded from reports using Audiences/BigQuery. They cannot be disabled
/// per-event from code without disabling all auto-collection.
class AnalyticsHelper {
  static FirebaseAnalytics? get _analytics {
    // Avoid initializing Firebase Analytics in unit/widget tests
    if (kIsWeb || !kDebugMode) return FirebaseAnalytics.instance;
    try {
      return FirebaseAnalytics.instance;
    } catch (e) {
      return null;
    }
  }

  // ---------------------------------------------------------------------------
  // Map events
  // ---------------------------------------------------------------------------

  /// Logged when the user taps a map on the main maps screen.
  static Future<void> logMapSelected(String mapName) async {
    if (kDebugMode) debugPrint('[Analytics] map_selected: $mapName');
    await _analytics?.logEvent(
      name: 'map_selected',
      parameters: {'map_name': mapName.toLowerCase()},
    );
  }

  // ---------------------------------------------------------------------------
  // Utility events
  // ---------------------------------------------------------------------------

  /// Logged when the user toggles a utility type (smoke, flash, molotov)
  /// in the radar screen's AppBar filter row.
  static Future<void> logUtilSelected({
    required String utilType,
    required String team,
    required String mapName,
  }) async {
    if (kDebugMode) {
      debugPrint(
          '[Analytics] util_selected: $utilType | team=$team | map=$mapName');
    }
    await _analytics?.logEvent(
      name: 'util_selected',
      parameters: {
        'util_type': utilType.toLowerCase(),
        'team': team.toLowerCase(),
        'map_name': mapName.toLowerCase(),
      },
    );
  }

  // ---------------------------------------------------------------------------
  // Ad events
  // ---------------------------------------------------------------------------

  /// Logged when a native ad is clicked on the info screen.
  static Future<void> logNativeAdClicked() async {
    if (kDebugMode) debugPrint('[Analytics] ad_clicked: native');
    await _analytics?.logEvent(
      name: 'ad_clicked',
      parameters: {'ad_type': 'native'},
    );
  }

  /// Logged when a banner ad is clicked.
  static Future<void> logBannerAdClicked() async {
    if (kDebugMode) debugPrint('[Analytics] ad_clicked: banner');
    await _analytics?.logEvent(
      name: 'ad_clicked',
      parameters: {'ad_type': 'banner'},
    );
  }

  /// Logged when a self sponsor ad is shown.
  static Future<void> logSponsorImpression({
    required String sponsorId,
    required String placement,
    required String appId,
    required String campaignTitle,
  }) async {
    if (kDebugMode) {
      debugPrint('[Analytics] sponsor_impression: $sponsorId | $placement');
    }
    await _analytics?.logEvent(
      name: 'sponsor_impression',
      parameters: {
        'sponsor_id': sponsorId,
        'placement': placement,
        'app_id': appId,
        'campaign_title': campaignTitle,
      },
    );
  }

  /// Logged when a self sponsor ad is clicked.
  static Future<void> logSponsorClick({
    required String sponsorId,
    required String placement,
    required String appId,
    required String campaignTitle,
  }) async {
    if (kDebugMode) {
      debugPrint('[Analytics] sponsor_click: $sponsorId | $placement');
    }
    await _analytics?.logEvent(
      name: 'sponsor_click',
      parameters: {
        'sponsor_id': sponsorId,
        'placement': placement,
        'app_id': appId,
        'campaign_title': campaignTitle,
      },
    );
  }
}
