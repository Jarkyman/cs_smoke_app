// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get maps => 'Mapas';

  @override
  String get notifications => 'Notificaciones';

  @override
  String get shareApp => 'Compartir app';

  @override
  String get rateApp => 'Calificar app';

  @override
  String get visitYoutube => 'Visitar YouTube';

  @override
  String get goBack => 'Volver';

  @override
  String get language => 'Idioma';

  @override
  String shareText(String shareUrl) {
    return '¡Hola! Acabo de descubrir esta increíble aplicación, Util Master, que te ayuda a mejorar tus habilidades en CS2. \n\nMírala aquí: $shareUrl';
  }

  @override
  String get reportVideo => 'Reportar video';

  @override
  String get outdatedVideo => 'Video desactualizado';

  @override
  String get wrongData => 'Datos incorrectos';

  @override
  String get videoNotWorking => 'El video no funciona';

  @override
  String get submitReport => 'Enviar';

  @override
  String get reportSubmitted => 'Reporte enviado';
}
