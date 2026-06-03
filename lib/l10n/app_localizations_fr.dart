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

  @override
  String get createPin => 'Créer un pin';

  @override
  String get videoUrl => 'URL de la vidéo';

  @override
  String get description => 'Description';

  @override
  String get selectMap => 'Sélectionner une carte';

  @override
  String get next => 'Suivant';

  @override
  String get cancel => 'Annuler';

  @override
  String get done => 'Terminé';

  @override
  String get undo => 'Annuler';

  @override
  String get redo => 'Rétablir';

  @override
  String get placeUtilPosition => 'Appuie sur la carte pour placer ton utility';

  @override
  String get placeStandPosition =>
      'Appuie pour placer les positions de lancer (max. 10)';

  @override
  String get confirmDone => 'Tu as terminé ?';

  @override
  String get confirmDoneBody => 'Tous les utilities placés seront sauvegardés.';

  @override
  String get confirmCancel => 'Annuler la création ?';

  @override
  String get confirmCancelBody => 'Toute la progression sera perdue.';

  @override
  String get confirmYes => 'Oui';

  @override
  String get confirmNo => 'Non';

  @override
  String get deletePin => 'Supprimer le pin';

  @override
  String get confirmDelete => 'Supprimer cette position de lancer ?';

  @override
  String get confirmDeleteBody => 'Cette action est irréversible.';

  @override
  String get openVideo => 'Ouvrir la vidéo';

  @override
  String get maxStandsReached => 'Maximum de 10 positions de lancer atteint';

  @override
  String get selectUtilTypeFirst => 'Sélectionne d\'abord un type d\'utility';

  @override
  String get addAtLeastOneStand => 'Ajoute au moins une position de lancer';

  @override
  String utilsAdded(int count) {
    return '$count utility ajouté(s)';
  }
}
