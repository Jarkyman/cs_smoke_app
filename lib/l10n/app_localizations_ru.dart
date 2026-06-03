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

  @override
  String get createPin => 'Создать пин';

  @override
  String get videoUrl => 'URL видео';

  @override
  String get description => 'Описание';

  @override
  String get selectMap => 'Выбрать карту';

  @override
  String get next => 'Далее';

  @override
  String get cancel => 'Отмена';

  @override
  String get done => 'Готово';

  @override
  String get undo => 'Отменить';

  @override
  String get redo => 'Повторить';

  @override
  String get placeUtilPosition => 'Нажмите на карту, чтобы разместить утилиту';

  @override
  String get placeStandPosition =>
      'Нажмите, чтобы добавить позиции броска (макс. 10)';

  @override
  String get confirmDone => 'Вы закончили?';

  @override
  String get confirmDoneBody => 'Все размещённые утилиты будут сохранены.';

  @override
  String get confirmCancel => 'Отменить создание?';

  @override
  String get confirmCancelBody => 'Весь прогресс будет потерян.';

  @override
  String get confirmYes => 'Да';

  @override
  String get confirmNo => 'Нет';

  @override
  String get deletePin => 'Удалить пин';

  @override
  String get confirmDelete => 'Удалить эту позицию броска?';

  @override
  String get confirmDeleteBody => 'Это действие нельзя отменить.';

  @override
  String get openVideo => 'Открыть видео';

  @override
  String get maxStandsReached => 'Достигнут максимум из 10 позиций броска';

  @override
  String get selectUtilTypeFirst => 'Сначала выберите тип утилиты';

  @override
  String get addAtLeastOneStand => 'Добавьте хотя бы одну позицию броска';

  @override
  String utilsAdded(int count) {
    return 'Добавлено утилит: $count';
  }
}
