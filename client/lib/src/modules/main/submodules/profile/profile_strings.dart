class ProfileStrings {
  static const String openSettings = 'Abrir configurações';

  static const directActionTile = _DirectActionTile();
  static const menuTile = _MenuTile();
  static const modalSignOut = _ModalSignOut();
}

class _MenuTile {
  const _MenuTile();

  String get myInfoFieldName => 'Meus dados';
  String get myInfoDescription => 'Edite seus dados de contato e endereço';

  String get securityFieldName => 'Segurança';
  String get securityDescription => 'Altere sua senha';

  String get biometryFieldName => 'Biometria';
  String get biometryDescription => 'Habilite a biometria do seu aparelho';

  String get notificationsFieldName => 'Notificações';
  String get notificationsDescription => 'Gerencie as notificações do seu app';

  String get termsAndPrivacyPoliciesFieldName => 'Termos e política de privacidade';
  String get termsAndPrivacyPoliciesDescription => 'Nossos termos e política de privacidade';

  String get helpMeFieldName => 'Me ajuda';
  String get helpMeDescription => 'Leia o FAQ e fale com nosso atendimento';

  String get closeAccountFieldName => 'Encerrar conta';
  String get closeAccountDescription => 'Encerrar sua conta no app';

  String get aboutFieldName => 'Sobre';
  String get aboutDescription => 'Sobre esta versão';
}

class _DirectActionTile {
  const _DirectActionTile();

  String get logOut => 'Sair';
}

class _ModalSignOut {
  const _ModalSignOut();

  String get title => 'Sair do App Derma Check';

  String get description => 'Deseja realmente sair do App Derma Check?';

  String get firstButtonTitle => 'Sair';

  String get secondButtonTitle => 'Cancelar';
}
