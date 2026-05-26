// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get maps => 'Kartat';

  @override
  String get notifications => 'Ilmoitukset';

  @override
  String get shareApp => 'Jaa sovellus';

  @override
  String get rateApp => 'Arvostele sovellus';

  @override
  String get visitYoutube => 'Vieraile YouTubessa';

  @override
  String get goBack => 'Palaa';

  @override
  String get language => 'Kieli';

  @override
  String shareText(String shareUrl) {
    return 'Hei! Löysin juuri tämän upean sovelluksen, Util Masterin, joka auttaa parantamaan CS2-taitojasi. \n\nKatso se täältä: $shareUrl';
  }
}
