import 'package:derma_detect/src/app_module.dart';
import 'package:derma_detect/src/modules/main/presentation/cubits/main_cubit.dart';
import 'package:derma_detect/src/modules/main/presentation/main_page.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/analysis_module.dart';
import 'package:derma_detect/src/modules/main/submodules/home/home_module.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/profile_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MainModule extends Module {
  static const moduleName = '/main-module';
  static const routePath = AppModule.routePath + moduleName;

  @override
  List<Module> get imports => [
        HomeSubmodule(),
        AnalysisSubmodule(),
        ProfileSubmodule(),
      ];

  @override
  void binds(i) {
    //Cubits
    i.addLazySingleton(() => MainCubit());
  }

  @override
  void routes(r) {
    r.redirect(
      MainModule.routePath,
      to: MainPage.routePath,
    );
    r.child(
      MainPage.routeName,
      child: (_) => const MainPage(),
    );
    r.module(
      HomeSubmodule.moduleName,
      module: HomeSubmodule(),
    );
    r.module(
      ProfileSubmodule.moduleName,
      module: ProfileSubmodule(),
    );
    r.module(
      AnalysisSubmodule.moduleName,
      module: AnalysisSubmodule(),
    );

    HomeSubmodule.homeRoutes(r);
    ProfileSubmodule.profileRoutes(r);
    AnalysisSubmodule.analysisRoutes(r);
  }
}
