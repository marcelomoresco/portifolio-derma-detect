import 'package:derma_detect/src/modules/main/submodules/profile/presentation/submodules/about/about_module.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/presentation/submodules/faq/faq_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileNavigator {
  ProfileNavigator();

  void openAboutPage() {
    Modular.to.pushNamed(AboutModule.moduleName);
  }

  void openFaq() {
    Modular.to.pushNamed(FaqModule.moduleName);
  }

  void openAccount() {}
}
