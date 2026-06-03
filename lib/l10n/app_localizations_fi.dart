// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get maps => 'Kartat';

  @override
  String get notifications => 'Ilmoitukset';

  @override
  String get shareApp => 'Jaa sovellus';

  @override
  String get rateApp => 'Arvostele sovellus';

  @override
  String get visitYoutube => 'Vieraile YouTubessa';

  @override
  String get goBack => 'Palaa';

  @override
  String get language => 'Kieli';

  @override
  String shareText(String shareUrl) {
    return 'Hei! Löysin juuri tämän upean sovelluksen, Util Masterin, joka auttaa parantamaan CS2-taitojasi. \n\nKatso se täältä: $shareUrl';
  }

  @override
  String get reportVideo => 'Ilmoita videosta';

  @override
  String get outdatedVideo => 'Vanhentunut video';

  @override
  String get wrongData => 'Väärät tiedot';

  @override
  String get videoNotWorking => 'Video ei toimi';

  @override
  String get submitReport => 'Lähetä';

  @override
  String get reportSubmitted => 'Ilmoitus lähetetty';

  @override
  String get createPin => 'Luo pin';

  @override
  String get videoUrl => 'Videon URL';

  @override
  String get description => 'Kuvaus';

  @override
  String get selectMap => 'Valitse kartta';

  @override
  String get next => 'Seuraava';

  @override
  String get cancel => 'Peruuta';

  @override
  String get done => 'Valmis';

  @override
  String get undo => 'Kumoa';

  @override
  String get redo => 'Tee uudelleen';

  @override
  String get placeUtilPosition => 'Napauta karttaa sijoittaaksesi utilityn';

  @override
  String get placeStandPosition =>
      'Napauta lisätäksesi heittopaikkoja (maks. 10)';

  @override
  String get confirmDone => 'Oletko valmis?';

  @override
  String get confirmDoneBody => 'Kaikki sijoitetut utilityit tallennetaan.';

  @override
  String get confirmCancel => 'Peruutetaanko luonti?';

  @override
  String get confirmCancelBody => 'Kaikki edistyminen menetetään.';

  @override
  String get confirmYes => 'Kyllä';

  @override
  String get confirmNo => 'Ei';

  @override
  String get deletePin => 'Poista pin';

  @override
  String get confirmDelete => 'Poistetaanko tämä heittopaika?';

  @override
  String get confirmDeleteBody => 'Tätä ei voi kumota.';

  @override
  String get openVideo => 'Avaa video';

  @override
  String get maxStandsReached => 'Enimmäismäärä 10 heittopaikkaa saavutettu';

  @override
  String get selectUtilTypeFirst => 'Valitse ensin utility-tyyppi';

  @override
  String get addAtLeastOneStand => 'Lisää vähintään yksi heittopaika';

  @override
  String utilsAdded(int count) {
    return '$count utility lisätty';
  }
}
