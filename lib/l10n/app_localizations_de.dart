// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get maps => 'Karten';

  @override
  String get notifications => 'Benachrichtigungen';

  @override
  String get shareApp => 'App teilen';

  @override
  String get rateApp => 'App bewerten';

  @override
  String get visitYoutube => 'YouTube besuchen';

  @override
  String get goBack => 'Zurück';

  @override
  String get language => 'Sprache';

  @override
  String shareText(String shareUrl) {
    return 'Hallo! Ich habe gerade diese tolle App, Util Master, entdeckt, die dir hilft, deine CS2-Fähigkeiten zu verbessern. \n\nSchau es dir hier an: $shareUrl';
  }
}
