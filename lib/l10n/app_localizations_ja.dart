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

  @override
  String get createPin => 'ピンを作成';

  @override
  String get videoUrl => '動画URL';

  @override
  String get description => '説明';

  @override
  String get selectMap => 'マップを選択';

  @override
  String get next => '次へ';

  @override
  String get cancel => 'キャンセル';

  @override
  String get done => '完了';

  @override
  String get undo => '元に戻す';

  @override
  String get redo => 'やり直し';

  @override
  String get placeUtilPosition => 'マップをタップしてユーティリティを配置';

  @override
  String get placeStandPosition => '投げ位置をタップして配置（最大10か所）';

  @override
  String get confirmDone => '完了しましたか？';

  @override
  String get confirmDoneBody => '配置したすべてのユーティリティが保存されます。';

  @override
  String get confirmCancel => '作成をキャンセルしますか？';

  @override
  String get confirmCancelBody => 'すべての進捗が失われます。';

  @override
  String get confirmYes => 'はい';

  @override
  String get confirmNo => 'いいえ';

  @override
  String get deletePin => 'ピンを削除';

  @override
  String get confirmDelete => 'この投げ位置を削除しますか？';

  @override
  String get confirmDeleteBody => 'この操作は元に戻せません。';

  @override
  String get openVideo => '動画を開く';

  @override
  String get maxStandsReached => '投げ位置は最大10か所です';

  @override
  String get selectUtilTypeFirst => '最初にユーティリティタイプを選択してください';

  @override
  String get addAtLeastOneStand => '少なくとも1か所の投げ位置を追加してください';

  @override
  String utilsAdded(int count) {
    return '$count個のユーティリティを追加しました';
  }
}
