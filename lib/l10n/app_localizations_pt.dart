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

  @override
  String get createPin => 'Criar pin';

  @override
  String get videoUrl => 'URL do vídeo';

  @override
  String get description => 'Descrição';

  @override
  String get selectMap => 'Selecionar mapa';

  @override
  String get next => 'Próximo';

  @override
  String get cancel => 'Cancelar';

  @override
  String get done => 'Concluído';

  @override
  String get undo => 'Desfazer';

  @override
  String get redo => 'Refazer';

  @override
  String get placeUtilPosition => 'Toque no mapa para colocar seu utility';

  @override
  String get placeStandPosition =>
      'Toque para colocar posições de arremesso (máx. 10)';

  @override
  String get confirmDone => 'Você terminou?';

  @override
  String get confirmDoneBody => 'Todos os utilities colocados serão salvos.';

  @override
  String get confirmCancel => 'Cancelar a criação?';

  @override
  String get confirmCancelBody => 'Todo o progresso será perdido.';

  @override
  String get confirmYes => 'Sim';

  @override
  String get confirmNo => 'Não';

  @override
  String get deletePin => 'Excluir pin';

  @override
  String get confirmDelete => 'Excluir esta posição de arremesso?';

  @override
  String get confirmDeleteBody => 'Isso não pode ser desfeito.';

  @override
  String get openVideo => 'Abrir vídeo';

  @override
  String get maxStandsReached => 'Máximo de 10 posições de arremesso atingido';

  @override
  String get selectUtilTypeFirst => 'Selecione um tipo de utility primeiro';

  @override
  String get addAtLeastOneStand =>
      'Adicione pelo menos uma posição de arremesso';

  @override
  String utilsAdded(int count) {
    return '$count utility adicionado(s)';
  }
}
