import 'package:derma_detect/src/modules/login/login_module.dart';
import 'package:derma_detect/src/modules/login/presentation/pages/register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SharedNavigator {
  const SharedNavigator();

  void openLogin() {
    Modular.to.navigate(LoginModule.moduleName);
  }

  void openRegister() {
    Modular.to.pushNamed(RegisterPage.routePath);
  }
}
