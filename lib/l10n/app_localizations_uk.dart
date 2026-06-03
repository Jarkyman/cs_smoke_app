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

  @override
  String get reportVideo => 'Поскаржитися на відео';

  @override
  String get outdatedVideo => 'Застаріле відео';

  @override
  String get wrongData => 'Невірні дані';

  @override
  String get videoNotWorking => 'Відео не працює';

  @override
  String get submitReport => 'Надіслати';

  @override
  String get reportSubmitted => 'Звіт надіслано';

  @override
  String get createPin => 'Створити пін';

  @override
  String get videoUrl => 'URL відео';

  @override
  String get description => 'Опис';

  @override
  String get selectMap => 'Вибрати карту';

  @override
  String get next => 'Далі';

  @override
  String get cancel => 'Скасувати';

  @override
  String get done => 'Готово';

  @override
  String get undo => 'Скасувати дію';

  @override
  String get redo => 'Повторити дію';

  @override
  String get placeUtilPosition => 'Натисніть на карту, щоб розмістити утиліту';

  @override
  String get placeStandPosition =>
      'Натисніть, щоб додати позиції кидка (макс. 10)';

  @override
  String get confirmDone => 'Ви закінчили?';

  @override
  String get confirmDoneBody => 'Усі розміщені утиліти будуть збережені.';

  @override
  String get confirmCancel => 'Скасувати створення?';

  @override
  String get confirmCancelBody => 'Весь прогрес буде втрачено.';

  @override
  String get confirmYes => 'Так';

  @override
  String get confirmNo => 'Ні';

  @override
  String get deletePin => 'Видалити пін';

  @override
  String get confirmDelete => 'Видалити цю позицію кидка?';

  @override
  String get confirmDeleteBody => 'Цю дію не можна скасувати.';

  @override
  String get openVideo => 'Відкрити відео';

  @override
  String get maxStandsReached => 'Досягнуто максимум із 10 позицій кидка';

  @override
  String get selectUtilTypeFirst => 'Спочатку виберіть тип утиліти';

  @override
  String get addAtLeastOneStand => 'Додайте принаймні одну позицію кидка';

  @override
  String utilsAdded(int count) {
    return 'Додано утиліт: $count';
  }
}
