// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get maps => 'マップ';

  @override
  String get notifications => '通知';

  @override
  String get shareApp => 'アプリを共有';

  @override
  String get rateApp => 'アプリを評価';

  @override
  String get visitYoutube => 'YouTubeを見る';

  @override
  String get goBack => '戻る';

  @override
  String get language => '言語';

  @override
  String shareText(String shareUrl) {
    return 'こんにちは！CS2のスキルを向上させるのに役立つ素晴らしいアプリ「Util Master」を見つけました。\n\nここでチェックしてください：$shareUrl';
  }

  @override
  String get reportVideo => '動画を報告';

  @override
  String get outdatedVideo => '古い動画';

  @override
  String get wrongData => '間違ったデータ';

  @override
  String get videoNotWorking => '動画が再生できない';

  @override
  String get submitReport => '送信';

  @override
  String get reportSubmitted => '報告を送信しました';
}
