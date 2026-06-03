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

  @override
  String get reportVideo => 'Rapporter video';

  @override
  String get outdatedVideo => 'Utdatert video';

  @override
  String get wrongData => 'Feil data';

  @override
  String get videoNotWorking => 'Videoen fungerer ikke';

  @override
  String get submitReport => 'Send inn';

  @override
  String get reportSubmitted => 'Rapport sendt';

  @override
  String get createPin => 'Opprett pin';

  @override
  String get videoUrl => 'Video-URL';

  @override
  String get description => 'Beskrivelse';

  @override
  String get selectMap => 'Velg kart';

  @override
  String get next => 'Neste';

  @override
  String get cancel => 'Avbryt';

  @override
  String get done => 'Ferdig';

  @override
  String get undo => 'Angre';

  @override
  String get redo => 'Gjenta';

  @override
  String get placeUtilPosition => 'Trykk på kartet for å plassere utilityen';

  @override
  String get placeStandPosition =>
      'Trykk for å plassere kasteposisjoner (maks 10)';

  @override
  String get confirmDone => 'Er du ferdig?';

  @override
  String get confirmDoneBody => 'Alle plasserte utilities vil bli lagret.';

  @override
  String get confirmCancel => 'Avbryte opprettelsen?';

  @override
  String get confirmCancelBody => 'All fremgang vil gå tapt.';

  @override
  String get confirmYes => 'Ja';

  @override
  String get confirmNo => 'Nei';

  @override
  String get deletePin => 'Slett pin';

  @override
  String get confirmDelete => 'Slette denne kasteposisjonen?';

  @override
  String get confirmDeleteBody => 'Dette kan ikke angres.';

  @override
  String get openVideo => 'Åpne video';

  @override
  String get maxStandsReached => 'Maks 10 kasteposisjoner nådd';

  @override
  String get selectUtilTypeFirst => 'Velg en utility-type først';

  @override
  String get addAtLeastOneStand => 'Legg til minst én kasteposisjon';

  @override
  String utilsAdded(int count) {
    return '$count utility lagt til';
  }
}
