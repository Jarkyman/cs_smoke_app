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

  @override
  String get createPin => 'Пин үүсгэх';

  @override
  String get videoUrl => 'Видео URL';

  @override
  String get description => 'Тайлбар';

  @override
  String get selectMap => 'Газрын зураг сонгох';

  @override
  String get next => 'Дараах';

  @override
  String get cancel => 'Цуцлах';

  @override
  String get done => 'Дуусгах';

  @override
  String get undo => 'Буцаах';

  @override
  String get redo => 'Дахин хийх';

  @override
  String get placeUtilPosition =>
      'Утилити байрлуулахын тулд газрын зургийг дарна уу';

  @override
  String get placeStandPosition =>
      'Шидэх байрлал тавихын тулд дарна уу (хамгийн ихдээ 10)';

  @override
  String get confirmDone => 'Дуусгах уу?';

  @override
  String get confirmDoneBody => 'Байрлуулсан бүх утилити хадгалагдана.';

  @override
  String get confirmCancel => 'Үүсгэхийг цуцлах уу?';

  @override
  String get confirmCancelBody => 'Бүх дэвшил алдагдана.';

  @override
  String get confirmYes => 'Тийм';

  @override
  String get confirmNo => 'Үгүй';

  @override
  String get deletePin => 'Пин устгах';

  @override
  String get confirmDelete => 'Энэ шидэх байрлалыг устгах уу?';

  @override
  String get confirmDeleteBody => 'Энэ үйлдлийг буцаах боломжгүй.';

  @override
  String get openVideo => 'Видео нээх';

  @override
  String get maxStandsReached => 'Хамгийн ихдээ 10 шидэх байрлалд хүрлээ';

  @override
  String get selectUtilTypeFirst => 'Эхлээд утилитийн төрлийг сонгоно уу';

  @override
  String get addAtLeastOneStand => 'Дор хаяж нэг шидэх байрлал нэмнэ үү';

  @override
  String utilsAdded(int count) {
    return '$count утилити нэмэгдлээ';
  }
}
