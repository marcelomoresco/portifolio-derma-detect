import 'package:derma_detect/src/app_module.dart';
import 'package:derma_detect/src/modules/auth/data/datasource/auth_remote_datasource.dart';
import 'package:derma_detect/src/modules/auth/data/repository/auth_repository_impl.dart';
import 'package:derma_detect/src/modules/auth/domain/repository/auth_repository.dart';
import 'package:derma_detect/src/modules/auth/domain/usecases/sign_in_usecase.dart';
import 'package:derma_detect/src/modules/auth/domain/usecases/sign_up_usecase.dart';
import 'package:derma_detect/src/modules/auth/presentation/cubit/login_cubit.dart';
import 'package:derma_detect/src/modules/auth/presentation/cubit/register_cubit.dart';
import 'package:derma_detect/src/modules/auth/presentation/pages/login_page.dart';
import 'package:derma_detect/src/modules/auth/presentation/pages/register_page.dart';
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
    //Datasource
    i.addLazySingleton<AuthRemoteDatasource>(
      () => AuthRemoteDatasourceImpl(
        networkService: i(),
      ),
    );

    //Repositorys
    i.addLazySingleton<AuthRepository>(() => AuthRepositoryImpl(datasource: i()));

    //Usecases
    i.addLazySingleton(() => SignInUsecase(repository: i()));
    i.addLazySingleton(() => SignUpUsecase(repository: i()));

    i.addLazySingleton(
      () => LoginCubit(
        sharedNavigator: i(),
        signInUsecase: i(),
      ),
    );
    i.addLazySingleton(
      () => RegisterCubit(
        sharedNavigator: i(),
        signUpUsecase: i(),
      ),
    );

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
