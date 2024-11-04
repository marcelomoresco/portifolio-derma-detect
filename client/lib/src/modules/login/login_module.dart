import 'package:derma_detect/src/app_module.dart';
import 'package:derma_detect/src/modules/login/presentation/cubit/login_cubit.dart';
import 'package:derma_detect/src/modules/login/presentation/cubit/register_cubit.dart';
import 'package:derma_detect/src/modules/login/presentation/pages/login_page.dart';
import 'package:derma_detect/src/modules/login/presentation/pages/register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  static const moduleName = '/login-module';
  static const routePath = AppModule.routePath + moduleName;

  @override
  List<Module> get imports => [
        AppModule(),
      ];

  @override
  void binds(Injector i) {
    i.addLazySingleton(
      () => LoginCubit(
        sharedNavigator: i(),
      ),
    );
    i.addLazySingleton(() => RegisterCubit(sharedNavigator: i()));

    super.binds(i);
  }

  @override
  void routes(r) {
    r.redirect(
      LoginModule.routePath,
      to: LoginPage.routePath,
    );
    r.child(
      LoginPage.routeName,
      child: (_) => const LoginPage(),
    );
    r.child(
      RegisterPage.routeName,
      child: (_) => const RegisterPage(),
    );
  }
}
