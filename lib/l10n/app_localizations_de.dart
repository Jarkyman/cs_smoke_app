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

  @override
  String get reportVideo => 'Video melden';

  @override
  String get outdatedVideo => 'Veraltetes Video';

  @override
  String get wrongData => 'Falsche Daten';

  @override
  String get videoNotWorking => 'Video funktioniert nicht';

  @override
  String get submitReport => 'Senden';

  @override
  String get reportSubmitted => 'Bericht gesendet';

  @override
  String get createPin => 'Pin erstellen';

  @override
  String get videoUrl => 'Video-URL';

  @override
  String get description => 'Beschreibung';

  @override
  String get selectMap => 'Karte auswählen';

  @override
  String get next => 'Weiter';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get done => 'Fertig';

  @override
  String get undo => 'Rückgängig';

  @override
  String get redo => 'Wiederholen';

  @override
  String get placeUtilPosition =>
      'Tippe auf die Karte, um dein Utility zu platzieren';

  @override
  String get placeStandPosition =>
      'Tippe zum Platzieren der Wurfpositionen (max. 10)';

  @override
  String get confirmDone => 'Bist du fertig?';

  @override
  String get confirmDoneBody =>
      'Alle platzierten Utilities werden gespeichert.';

  @override
  String get confirmCancel => 'Erstellung abbrechen?';

  @override
  String get confirmCancelBody => 'Alle Fortschritte gehen verloren.';

  @override
  String get confirmYes => 'Ja';

  @override
  String get confirmNo => 'Nein';

  @override
  String get deletePin => 'Pin löschen';

  @override
  String get confirmDelete => 'Diese Wurfposition löschen?';

  @override
  String get confirmDeleteBody => 'Dies kann nicht rückgängig gemacht werden.';

  @override
  String get openVideo => 'Video öffnen';

  @override
  String get maxStandsReached => 'Maximal 10 Wurfpositionen erreicht';

  @override
  String get selectUtilTypeFirst => 'Zuerst einen Utility-Typ auswählen';

  @override
  String get addAtLeastOneStand => 'Mindestens eine Wurfposition hinzufügen';

  @override
  String utilsAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Utilities',
      one: 'Utility',
    );
    return '$count $_temp0 hinzugefügt';
  }
}
