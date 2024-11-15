import 'package:derma_detect/src/app_module.dart';
import 'package:derma_detect/src/modules/main/main_module.dart';
import 'package:derma_detect/src/modules/main/submodules/home/presentation/cubits/home_cubit.dart';
import 'package:derma_detect/src/modules/main/submodules/home/presentation/pages/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeSubmodule extends Module {
  static const moduleName = '/home';
  static const routePath = MainModule.routePath + moduleName;

  @override
  List<Module> get imports => [
        AppModule(),
      ];

  @override
  void binds(i) {
    //Cubits
    i.addLazySingleton(
      () => HomeCubit(
        sharedNavigator: i(),
        getUserProfileUsecase: i(),
      ),
    );
  }

  static void homeRoutes(
    RouteManager r,
  ) {
    r.child(
      HomePage.routeName,
      child: (_) => const HomePage(),
    );
  }
}
