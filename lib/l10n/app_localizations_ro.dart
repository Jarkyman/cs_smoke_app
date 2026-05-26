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
}
