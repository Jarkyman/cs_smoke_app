// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get maps => 'Карти';

  @override
  String get notifications => 'Сповіщення';

  @override
  String get shareApp => 'Поділитися';

  @override
  String get rateApp => 'Оцінити додаток';

  @override
  String get visitYoutube => 'Відвідати YouTube';

  @override
  String get goBack => 'Назад';

  @override
  String get language => 'Мова';

  @override
  String shareText(String shareUrl) {
    return 'Привіт! Я щойно знайшов чудовий додаток Util Master, який допомагає покращити навички в CS2. \n\nПодивись тут: $shareUrl';
  }
}
