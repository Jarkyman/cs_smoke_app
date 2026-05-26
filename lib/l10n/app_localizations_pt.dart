// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get maps => 'Mapas';

  @override
  String get notifications => 'Notificações';

  @override
  String get shareApp => 'Compartilhar app';

  @override
  String get rateApp => 'Avaliar app';

  @override
  String get visitYoutube => 'Visitar YouTube';

  @override
  String get goBack => 'Voltar';

  @override
  String get language => 'Idioma';

  @override
  String shareText(String shareUrl) {
    return 'Ei! Acabei de descobrir este aplicativo incrível, Util Master, que ajuda a melhorar suas habilidades no CS2. \n\nConfira aqui: $shareUrl';
  }

  @override
  String get reportVideo => 'Denunciar vídeo';

  @override
  String get outdatedVideo => 'Vídeo desatualizado';

  @override
  String get wrongData => 'Dados incorretos';

  @override
  String get videoNotWorking => 'O vídeo não funciona';

  @override
  String get submitReport => 'Enviar';

  @override
  String get reportSubmitted => 'Relatório enviado';
}
