// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get maps => 'Kort';

  @override
  String get notifications => 'Notifikationer';

  @override
  String get shareApp => 'Del appen';

  @override
  String get rateApp => 'Bedøm appen';

  @override
  String get visitYoutube => 'Besøg YouTube';

  @override
  String get goBack => 'Gå tilbage';

  @override
  String get language => 'Sprog';

  @override
  String shareText(String shareUrl) {
    return 'Hej! Jeg har lige opdaget denne fantastiske app, Util Master, som hjælper med at forbedre dine CS2 skills. \n\nTjek den ud her: $shareUrl';
  }

  @override
  String get reportVideo => 'Rapporter video';

  @override
  String get outdatedVideo => 'Forældet video';

  @override
  String get wrongData => 'Forkert data';

  @override
  String get videoNotWorking => 'Videoen virker ikke';

  @override
  String get submitReport => 'Indsend';

  @override
  String get reportSubmitted => 'Rapport indsendt';
}
