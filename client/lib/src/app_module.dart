import 'package:derma_detect/src/core/services/network/dio/base_dio.dart';
import 'package:derma_detect/src/core/services/network/dio/dio_client_impl.dart';
import 'package:derma_detect/src/core/services/network/network_service.dart';
import 'package:derma_detect/src/core/utils/shared_navigator.dart';
import 'package:derma_detect/src/modules/auth/login_module.dart';
import 'package:derma_detect/src/modules/main/main_module.dart';
import 'package:derma_detect/src/modules/splash/splash_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  static const routePath = '';

  @override
  void binds(i) {
    // Navigator
    i.addLazySingleton(() => const SharedNavigator());
    i.add<BaseDio>(() => BaseDio());
    i.addLazySingleton<NetworkService>(
      () => DioClientService(dio: i<BaseDio>()),
    );
  }

  @override
  void routes(r) {
    r.redirect(
      Modular.initialRoute,
      to: SplashModule.routePath,
    );
    r.module(
      SplashModule.moduleName,
      module: SplashModule(),
    );
    r.module(
      LoginModule.moduleName,
      module: LoginModule(),
    );
    r.module(
      MainModule.moduleName,
      module: MainModule(),
    );
  }
}
