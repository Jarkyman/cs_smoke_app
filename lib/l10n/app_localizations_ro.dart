// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get maps => 'Hărți';

  @override
  String get notifications => 'Notificări';

  @override
  String get shareApp => 'Distribuie aplicația';

  @override
  String get rateApp => 'Evaluează aplicația';

  @override
  String get visitYoutube => 'Vizitează YouTube';

  @override
  String get goBack => 'Înapoi';

  @override
  String get language => 'Limbă';

  @override
  String shareText(String shareUrl) {
    return 'Salut! Tocmai am descoperit această aplicație uimitoare, Util Master, care te ajută să-ți îmbunătățești abilitățile în CS2. \n\nVerific-o aici: $shareUrl';
  }

  @override
  String get reportVideo => 'Raportează videoclipul';

  @override
  String get outdatedVideo => 'Videoclip învechit';

  @override
  String get wrongData => 'Date greșite';

  @override
  String get videoNotWorking => 'Videoclipul nu funcționează';

  @override
  String get submitReport => 'Trimite';

  @override
  String get reportSubmitted => 'Raport trimis';

  @override
  String get createPin => 'Creează pin';

  @override
  String get videoUrl => 'URL video';

  @override
  String get description => 'Descriere';

  @override
  String get selectMap => 'Selectează harta';

  @override
  String get next => 'Următor';

  @override
  String get cancel => 'Anulează';

  @override
  String get done => 'Gata';

  @override
  String get undo => 'Anulează acțiunea';

  @override
  String get redo => 'Refă acțiunea';

  @override
  String get placeUtilPosition => 'Atinge harta pentru a plasa utilitarul';

  @override
  String get placeStandPosition =>
      'Atinge pentru a plasa pozițiile de aruncare (max. 10)';

  @override
  String get confirmDone => 'Ai terminat?';

  @override
  String get confirmDoneBody => 'Toate utilitarele plasate vor fi salvate.';

  @override
  String get confirmCancel => 'Anulezi crearea?';

  @override
  String get confirmCancelBody => 'Tot progresul va fi pierdut.';

  @override
  String get confirmYes => 'Da';

  @override
  String get confirmNo => 'Nu';

  @override
  String get deletePin => 'Șterge pin';

  @override
  String get confirmDelete => 'Ștergi această poziție de aruncare?';

  @override
  String get confirmDeleteBody => 'Aceasta nu poate fi anulată.';

  @override
  String get openVideo => 'Deschide videoclipul';

  @override
  String get maxStandsReached => 'S-a atins limita de 10 poziții de aruncare';

  @override
  String get selectUtilTypeFirst => 'Selectează mai întâi un tip de utilitar';

  @override
  String get addAtLeastOneStand => 'Adaugă cel puțin o poziție de aruncare';

  @override
  String utilsAdded(int count) {
    return '$count utilitar(e) adăugat(e)';
  }
}
