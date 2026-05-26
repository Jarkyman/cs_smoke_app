// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian (`no`).
class AppLocalizationsNo extends AppLocalizations {
  AppLocalizationsNo([String locale = 'no']) : super(locale);

  @override
  String get maps => 'Kart';

  @override
  String get notifications => 'Varsler';

  @override
  String get shareApp => 'Del appen';

  @override
  String get rateApp => 'Vurder appen';

  @override
  String get visitYoutube => 'Besøk YouTube';

  @override
  String get goBack => 'Gå tilbake';

  @override
  String get language => 'Språk';

  @override
  String shareText(String shareUrl) {
    return 'Hei! Jeg oppdaget nettopp denne fantastiske appen, Util Master, som hjelper deg med å forbedre CS2-ferdighetene dine. \n\nSjekk den ut her: $shareUrl';
  }
}
