// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get maps => 'Kartor';

  @override
  String get notifications => 'Notiser';

  @override
  String get shareApp => 'Dela appen';

  @override
  String get rateApp => 'Betygsätt appen';

  @override
  String get visitYoutube => 'Besök YouTube';

  @override
  String get goBack => 'Gå tillbaka';

  @override
  String get language => 'Språk';

  @override
  String shareText(String shareUrl) {
    return 'Hej! Jag upptäckte precis den här fantastiska appen, Util Master, som hjälper till att förbättra dina CS2-färdigheter. \n\nKolla in den här: $shareUrl';
  }

  @override
  String get reportVideo => 'Rapportera video';

  @override
  String get outdatedVideo => 'Föråldrad video';

  @override
  String get wrongData => 'Felaktig data';

  @override
  String get videoNotWorking => 'Videon fungerar inte';

  @override
  String get submitReport => 'Skicka';

  @override
  String get reportSubmitted => 'Rapport skickad';
}
