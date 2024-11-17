import 'package:derma_detect/src/app_module.dart';
import 'package:derma_detect/src/core/utils/shared_navigator.dart';
import 'package:derma_detect/src/modules/splash/presentation/cubit/welcome_cubit.dart';
import 'package:derma_detect/src/modules/splash/presentation/pages/splash_page.dart';
import 'package:derma_detect/src/modules/splash/presentation/pages/welcome_page.dart';
import 'package:derma_detect/src/modules/splash/splash_navigator.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends Module {
  static const moduleName = '/splash-module';
  static const routePath = AppModule.routePath + moduleName;

  @override
  List<Module> get imports => [
        AppModule(),
      ];

  @override
  void binds(Injector i) {
    i.addLazySingleton(() => SplashNavigator());
    i.addLazySingleton(() => const SharedNavigator());
    i.addLazySingleton(
      () => WelcomeCubit(
        sharedNavigator: i(),
        getTokenUsecase: i(),
      ),
    );
    super.binds(i);
  }

  @override
  void routes(r) {
    r.redirect(
      SplashModule.routePath,
      to: SplashPage.routePath,
    );
    r.child(
      SplashPage.routeName,
      child: (_) => const SplashPage(),
    );
    r.child(
      WelcomePage.routeName,
      child: (_) => const WelcomePage(),
    );
  }
}
