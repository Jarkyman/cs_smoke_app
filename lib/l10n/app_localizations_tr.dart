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

  @override
  String get createPin => 'Pin oluştur';

  @override
  String get videoUrl => 'Video URL\'si';

  @override
  String get description => 'Açıklama';

  @override
  String get selectMap => 'Harita seç';

  @override
  String get next => 'İleri';

  @override
  String get cancel => 'İptal';

  @override
  String get done => 'Bitti';

  @override
  String get undo => 'Geri al';

  @override
  String get redo => 'Yinele';

  @override
  String get placeUtilPosition => 'Utility yerleştirmek için haritaya dokun';

  @override
  String get placeStandPosition =>
      'Atış pozisyonu eklemek için dokun (maks. 10)';

  @override
  String get confirmDone => 'Bitti mi?';

  @override
  String get confirmDoneBody => 'Yerleştirilen tüm utility\'ler kaydedilecek.';

  @override
  String get confirmCancel => 'Oluşturma iptal edilsin mi?';

  @override
  String get confirmCancelBody => 'Tüm ilerleme kaybolacak.';

  @override
  String get confirmYes => 'Evet';

  @override
  String get confirmNo => 'Hayır';

  @override
  String get deletePin => 'Pini sil';

  @override
  String get confirmDelete => 'Bu atış pozisyonu silinsin mi?';

  @override
  String get confirmDeleteBody => 'Bu işlem geri alınamaz.';

  @override
  String get openVideo => 'Videoyu aç';

  @override
  String get maxStandsReached => 'Maksimum 10 atış pozisyonuna ulaşıldı';

  @override
  String get selectUtilTypeFirst => 'Önce bir utility türü seçin';

  @override
  String get addAtLeastOneStand => 'En az bir atış pozisyonu ekleyin';

  @override
  String utilsAdded(int count) {
    return '$count utility eklendi';
  }
}
