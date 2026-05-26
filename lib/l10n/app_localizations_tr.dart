// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get maps => 'Haritalar';

  @override
  String get notifications => 'Bildirimler';

  @override
  String get shareApp => 'Uygulamayı paylaş';

  @override
  String get rateApp => 'Uygulamayı değerlendir';

  @override
  String get visitYoutube => 'YouTube\'u ziyaret et';

  @override
  String get goBack => 'Geri dön';

  @override
  String get language => 'Dil';

  @override
  String shareText(String shareUrl) {
    return 'Merhaba! CS2 becerilerini geliştirmene yardımcı olan harika bir uygulama buldum, Util Master. \n\nBuradan göz at: $shareUrl';
  }

  @override
  String get reportVideo => 'Videoyu bildir';

  @override
  String get outdatedVideo => 'Eski video';

  @override
  String get wrongData => 'Yanlış veri';

  @override
  String get videoNotWorking => 'Video çalışmıyor';

  @override
  String get submitReport => 'Gönder';

  @override
  String get reportSubmitted => 'Rapor gönderildi';
}
