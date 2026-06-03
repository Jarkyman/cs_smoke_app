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

  @override
  String get createPin => 'Crear pin';

  @override
  String get videoUrl => 'URL del video';

  @override
  String get description => 'Descripción';

  @override
  String get selectMap => 'Seleccionar mapa';

  @override
  String get next => 'Siguiente';

  @override
  String get cancel => 'Cancelar';

  @override
  String get done => 'Listo';

  @override
  String get undo => 'Deshacer';

  @override
  String get redo => 'Rehacer';

  @override
  String get placeUtilPosition => 'Toca el mapa para colocar tu utility';

  @override
  String get placeStandPosition =>
      'Toca para colocar posiciones de lanzamiento (máx. 10)';

  @override
  String get confirmDone => '¿Has terminado?';

  @override
  String get confirmDoneBody =>
      'Todas las utilities colocadas serán guardadas.';

  @override
  String get confirmCancel => '¿Cancelar la creación?';

  @override
  String get confirmCancelBody => 'Se perderá todo el progreso.';

  @override
  String get confirmYes => 'Sí';

  @override
  String get confirmNo => 'No';

  @override
  String get deletePin => 'Eliminar pin';

  @override
  String get confirmDelete => '¿Eliminar esta posición de lanzamiento?';

  @override
  String get confirmDeleteBody => 'Esto no se puede deshacer.';

  @override
  String get openVideo => 'Abrir video';

  @override
  String get maxStandsReached =>
      'Se alcanzó el máximo de 10 posiciones de lanzamiento';

  @override
  String get selectUtilTypeFirst => 'Selecciona un tipo de utility primero';

  @override
  String get addAtLeastOneStand =>
      'Agrega al menos una posición de lanzamiento';

  @override
  String utilsAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'utilities',
      one: 'utility',
    );
    return '$count $_temp0 añadida(s)';
  }
}
