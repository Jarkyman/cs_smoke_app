// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Mongolian (`mn`).
class AppLocalizationsMn extends AppLocalizations {
  AppLocalizationsMn([String locale = 'mn']) : super(locale);

  @override
  String get maps => 'Газрын зураг';

  @override
  String get notifications => 'Мэдэгдэл';

  @override
  String get shareApp => 'Апп хуваалцах';

  @override
  String get rateApp => 'Апп үнэлэх';

  @override
  String get visitYoutube => 'YouTube-д зочлох';

  @override
  String get goBack => 'Буцах';

  @override
  String get language => 'Хэл';

  @override
  String shareText(String shareUrl) {
    return 'Сайн уу! Би дөнгөж сая CS2 ур чадвараа сайжруулахад туслах энэхүү гайхалтай Util Master програмыг оллоо. \n\nЭндээс үзнэ үү: $shareUrl';
  }

  @override
  String get reportVideo => 'Видеог мэдээлэх';

  @override
  String get outdatedVideo => 'Хуучирсан видео';

  @override
  String get wrongData => 'Буруу өгөгдөл';

  @override
  String get videoNotWorking => 'Видео ажиллахгүй байна';

  @override
  String get submitReport => 'Илгээх';

  @override
  String get reportSubmitted => 'Тайлан илгээгдлээ';
}
