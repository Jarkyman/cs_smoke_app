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

  @override
  String get createPin => 'Create Pin';

  @override
  String get videoUrl => 'Video URL';

  @override
  String get description => 'Description';

  @override
  String get selectMap => 'Select map';

  @override
  String get next => 'Next';

  @override
  String get cancel => 'Cancel';

  @override
  String get done => 'Done';

  @override
  String get undo => 'Undo';

  @override
  String get redo => 'Redo';

  @override
  String get placeUtilPosition => 'Tap on the map to place your utility';

  @override
  String get placeStandPosition => 'Tap to place throw positions (max 10)';

  @override
  String get confirmDone => 'Are you done?';

  @override
  String get confirmDoneBody => 'All placed utilities will be saved.';

  @override
  String get confirmCancel => 'Cancel creation?';

  @override
  String get confirmCancelBody => 'All progress will be lost.';

  @override
  String get confirmYes => 'Yes';

  @override
  String get confirmNo => 'No';

  @override
  String get deletePin => 'Delete pin';

  @override
  String get confirmDelete => 'Delete this throw position?';

  @override
  String get confirmDeleteBody => 'This cannot be undone.';

  @override
  String get openVideo => 'Open video';

  @override
  String get maxStandsReached => 'Maximum 10 throw positions reached';

  @override
  String get selectUtilTypeFirst => 'Select a utility type first';

  @override
  String get addAtLeastOneStand => 'Add at least one throw position';

  @override
  String utilsAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'utilities',
      one: 'utility',
    );
    return '$count $_temp0 added';
  }
}
