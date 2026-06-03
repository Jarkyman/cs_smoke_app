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

  @override
  String get reportVideo => '举报视频';

  @override
  String get outdatedVideo => '视频过时';

  @override
  String get wrongData => '数据错误';

  @override
  String get videoNotWorking => '视频无法播放';

  @override
  String get submitReport => '提交';

  @override
  String get reportSubmitted => '报告已提交';

  @override
  String get createPin => '创建图钉';

  @override
  String get videoUrl => '视频链接';

  @override
  String get description => '描述';

  @override
  String get selectMap => '选择地图';

  @override
  String get next => '下一步';

  @override
  String get cancel => '取消';

  @override
  String get done => '完成';

  @override
  String get undo => '撤销';

  @override
  String get redo => '重做';

  @override
  String get placeUtilPosition => '点击地图放置道具';

  @override
  String get placeStandPosition => '点击放置投掷位置（最多10个）';

  @override
  String get confirmDone => '确认完成？';

  @override
  String get confirmDoneBody => '所有放置的道具将被保存。';

  @override
  String get confirmCancel => '取消创建？';

  @override
  String get confirmCancelBody => '所有进度将丢失。';

  @override
  String get confirmYes => '是';

  @override
  String get confirmNo => '否';

  @override
  String get deletePin => '删除图钉';

  @override
  String get confirmDelete => '删除此投掷位置？';

  @override
  String get confirmDeleteBody => '此操作无法撤销。';

  @override
  String get openVideo => '打开视频';

  @override
  String get maxStandsReached => '已达到最多10个投掷位置';

  @override
  String get selectUtilTypeFirst => '请先选择道具类型';

  @override
  String get addAtLeastOneStand => '请至少添加一个投掷位置';

  @override
  String utilsAdded(int count) {
    return '已添加 $count 个道具';
  }
}
