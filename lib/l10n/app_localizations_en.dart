// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get maps => 'Maps';

  @override
  String get notifications => 'Notifications';

  @override
  String get shareApp => 'Share app';

  @override
  String get rateApp => 'Rate app';

  @override
  String get visitYoutube => 'Visit YouTube';

  @override
  String get goBack => 'Go Back';

  @override
  String get language => 'Language';

  @override
  String shareText(String shareUrl) {
    return 'Hey there! I just discovered this amazing app, Util Master, that helps improve your CS2 skills. \n\nCheck it out here: $shareUrl';
  }

  @override
  String get reportVideo => 'Report Video';

  @override
  String get outdatedVideo => 'Outdated video';

  @override
  String get wrongData => 'Wrong data';

  @override
  String get videoNotWorking => 'Video does not work';

  @override
  String get submitReport => 'Submit';

  @override
  String get reportSubmitted => 'Report submitted';
}
