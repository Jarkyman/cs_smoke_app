// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get maps => 'Карты';

  @override
  String get notifications => 'Уведомления';

  @override
  String get shareApp => 'Поделиться';

  @override
  String get rateApp => 'Оценить приложение';

  @override
  String get visitYoutube => 'Посетить YouTube';

  @override
  String get goBack => 'Назад';

  @override
  String get language => 'Язык';

  @override
  String shareText(String shareUrl) {
    return 'Привет! Я только что нашел отличное приложение Util Master, которое помогает улучшить навыки в CS2. \n\nПосмотри здесь: $shareUrl';
  }

  @override
  String get reportVideo => 'Пожаловаться на видео';

  @override
  String get outdatedVideo => 'Устаревшее видео';

  @override
  String get wrongData => 'Неверные данные';

  @override
  String get videoNotWorking => 'Видео не работает';

  @override
  String get submitReport => 'Отправить';

  @override
  String get reportSubmitted => 'Отчет отправлен';
}
