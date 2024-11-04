import 'package:derma_detect/src/modules/main/main_module.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/presentation/pages/profile_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileSubmodule extends Module {
  static const moduleName = '/profile';
  static const routePath = MainModule.routePath + moduleName;

  @override
  void binds(i) {
    //Others
  }

  static void profileRoutes(
    RouteManager r,
  ) {
    r.child(
      ProfilePage.routeName,
      child: (_) => const ProfilePage(),
    );
  }
}
