import 'package:derma_detect/src/modules/splash/presentation/pages/welcome_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashNavigator {
  void openWelcomePage() {
    Modular.to.pushNamed(WelcomePage.routePath);
  }
}
