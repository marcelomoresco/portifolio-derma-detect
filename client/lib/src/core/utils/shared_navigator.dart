import 'package:derma_detect/src/modules/auth/login_module.dart';
import 'package:derma_detect/src/modules/auth/presentation/pages/register_page.dart';
import 'package:derma_detect/src/modules/main/main_module.dart';
import 'package:derma_detect/src/modules/splash/splash_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SharedNavigator {
  const SharedNavigator();

  void openLogin() {
    Modular.to.navigate(LoginModule.moduleName);
  }

  void openRegister() {
    Modular.to.pushNamed(RegisterPage.routePath);
  }

  void openMain() {
    Modular.to.navigate(
      MainModule.moduleName,
    );
  }

  void openFirstAccessModule() {
    Modular.to.navigate(SplashModule.moduleName);
  }
}
