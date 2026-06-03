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

  @override
  String get createPin => 'Opret pin';

  @override
  String get videoUrl => 'Video URL';

  @override
  String get description => 'Beskrivelse';

  @override
  String get selectMap => 'Vælg kort';

  @override
  String get next => 'Næste';

  @override
  String get cancel => 'Annuller';

  @override
  String get done => 'Færdig';

  @override
  String get undo => 'Fortryd';

  @override
  String get redo => 'Gentag';

  @override
  String get placeUtilPosition => 'Tryk på kortet for at placere din utility';

  @override
  String get placeStandPosition =>
      'Tryk for at placere kaste-positioner (maks 10)';

  @override
  String get confirmDone => 'Er du færdig?';

  @override
  String get confirmDoneBody => 'Alle placerede utilities gemmes.';

  @override
  String get confirmCancel => 'Annuller oprettelse?';

  @override
  String get confirmCancelBody => 'Alt fremskridt vil gå tabt.';

  @override
  String get confirmYes => 'Ja';

  @override
  String get confirmNo => 'Nej';

  @override
  String get deletePin => 'Slet pin';

  @override
  String get confirmDelete => 'Slet denne kaste-position?';

  @override
  String get confirmDeleteBody => 'Dette kan ikke fortrydes.';

  @override
  String get openVideo => 'Åbn video';

  @override
  String get maxStandsReached => 'Maks 10 kaste-positioner nået';

  @override
  String get selectUtilTypeFirst => 'Vælg en utility-type først';

  @override
  String get addAtLeastOneStand => 'Tilføj mindst én kaste-position';

  @override
  String utilsAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'utilities',
      one: 'utility',
    );
    return '$count $_temp0 tilføjet';
  }
}
