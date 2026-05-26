// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get maps => '地图';

  @override
  String get notifications => '通知';

  @override
  String get shareApp => '分享应用';

  @override
  String get rateApp => '评价应用';

  @override
  String get visitYoutube => '访问YouTube';

  @override
  String get goBack => '返回';

  @override
  String get language => '语言';

  @override
  String shareText(String shareUrl) {
    return '你好！我刚发现了一个很棒的应用程序，Util Master，它可以帮助提升你的CS2技能。\n\n在这里查看：$shareUrl';
  }
}
