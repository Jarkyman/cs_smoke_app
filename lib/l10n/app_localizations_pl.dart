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

  @override
  String get createPin => 'Utwórz pin';

  @override
  String get videoUrl => 'URL wideo';

  @override
  String get description => 'Opis';

  @override
  String get selectMap => 'Wybierz mapę';

  @override
  String get next => 'Dalej';

  @override
  String get cancel => 'Anuluj';

  @override
  String get done => 'Gotowe';

  @override
  String get undo => 'Cofnij';

  @override
  String get redo => 'Ponów';

  @override
  String get placeUtilPosition => 'Dotknij mapy, aby umieścić utility';

  @override
  String get placeStandPosition =>
      'Dotknij, aby umieścić pozycje rzutu (maks. 10)';

  @override
  String get confirmDone => 'Czy skończyłeś?';

  @override
  String get confirmDoneBody =>
      'Wszystkie umieszczone utilities zostaną zapisane.';

  @override
  String get confirmCancel => 'Anulować tworzenie?';

  @override
  String get confirmCancelBody => 'Cały postęp zostanie utracony.';

  @override
  String get confirmYes => 'Tak';

  @override
  String get confirmNo => 'Nie';

  @override
  String get deletePin => 'Usuń pin';

  @override
  String get confirmDelete => 'Usunąć tę pozycję rzutu?';

  @override
  String get confirmDeleteBody => 'Tej operacji nie można cofnąć.';

  @override
  String get openVideo => 'Otwórz wideo';

  @override
  String get maxStandsReached =>
      'Osiągnięto maksymalną liczbę 10 pozycji rzutu';

  @override
  String get selectUtilTypeFirst => 'Najpierw wybierz typ utility';

  @override
  String get addAtLeastOneStand => 'Dodaj co najmniej jedną pozycję rzutu';

  @override
  String utilsAdded(int count) {
    return 'Dodano $count utility';
  }
}
