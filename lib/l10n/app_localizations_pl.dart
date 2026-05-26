// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get maps => 'Mapy';

  @override
  String get notifications => 'Powiadomienia';

  @override
  String get shareApp => 'Udostępnij aplikację';

  @override
  String get rateApp => 'Oceń aplikację';

  @override
  String get visitYoutube => 'Odwiedź YouTube';

  @override
  String get goBack => 'Wróć';

  @override
  String get language => 'Język';

  @override
  String shareText(String shareUrl) {
    return 'Cześć! Właśnie odkryłem tę niesamowitą aplikację, Util Master, która pomaga poprawić umiejętności w CS2. \n\nSprawdź ją tutaj: $shareUrl';
  }

  @override
  String get reportVideo => 'Zgłoś wideo';

  @override
  String get outdatedVideo => 'Nieaktualne wideo';

  @override
  String get wrongData => 'Błędne dane';

  @override
  String get videoNotWorking => 'Wideo nie działa';

  @override
  String get submitReport => 'Wyślij';

  @override
  String get reportSubmitted => 'Zgłoszenie wysłane';
}
