// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get maps => 'Cartes';

  @override
  String get notifications => 'Notifications';

  @override
  String get shareApp => 'Partager l\'application';

  @override
  String get rateApp => 'Évaluer l\'application';

  @override
  String get visitYoutube => 'Visiter YouTube';

  @override
  String get goBack => 'Retour';

  @override
  String get language => 'Langue';

  @override
  String shareText(String shareUrl) {
    return 'Salut ! Je viens de découvrir cette application géniale, Util Master, qui t\'aide à améliorer tes compétences sur CS2. \n\nDécouvre-la ici : $shareUrl';
  }

  @override
  String get reportVideo => 'Signaler la vidéo';

  @override
  String get outdatedVideo => 'Vidéo obsolète';

  @override
  String get wrongData => 'Données incorrectes';

  @override
  String get videoNotWorking => 'La vidéo ne fonctionne pas';

  @override
  String get submitReport => 'Envoyer';

  @override
  String get reportSubmitted => 'Rapport envoyé';
}
