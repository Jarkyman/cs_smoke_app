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

  @override
  String get createPin => 'Skapa pin';

  @override
  String get videoUrl => 'Video-URL';

  @override
  String get description => 'Beskrivning';

  @override
  String get selectMap => 'Välj karta';

  @override
  String get next => 'Nästa';

  @override
  String get cancel => 'Avbryt';

  @override
  String get done => 'Klar';

  @override
  String get undo => 'Ångra';

  @override
  String get redo => 'Gör om';

  @override
  String get placeUtilPosition => 'Tryck på kartan för att placera din utility';

  @override
  String get placeStandPosition =>
      'Tryck för att placera kastpositioner (max 10)';

  @override
  String get confirmDone => 'Är du klar?';

  @override
  String get confirmDoneBody => 'Alla placerade utilities kommer att sparas.';

  @override
  String get confirmCancel => 'Avbryta skapandet?';

  @override
  String get confirmCancelBody => 'All framsteg kommer att gå förlorade.';

  @override
  String get confirmYes => 'Ja';

  @override
  String get confirmNo => 'Nej';

  @override
  String get deletePin => 'Ta bort pin';

  @override
  String get confirmDelete => 'Ta bort denna kastposition?';

  @override
  String get confirmDeleteBody => 'Det går inte att ångra detta.';

  @override
  String get openVideo => 'Öppna video';

  @override
  String get maxStandsReached => 'Max 10 kastpositioner nådd';

  @override
  String get selectUtilTypeFirst => 'Välj en utility-typ först';

  @override
  String get addAtLeastOneStand => 'Lägg till minst en kastposition';

  @override
  String utilsAdded(int count) {
    return '$count utility tillagd(a)';
  }
}
