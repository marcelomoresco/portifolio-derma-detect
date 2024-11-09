import 'package:derma_detect/src/core/data/datasource/shared_local_datasource.dart';
import 'package:derma_detect/src/core/data/repository/shared_repository_impl.dart';
import 'package:derma_detect/src/core/domain/repository/shared_repository.dart';
import 'package:derma_detect/src/core/domain/usecases/get_user_token_usecase.dart';
import 'package:derma_detect/src/core/domain/usecases/set_user_token_usecase.dart';
import 'package:derma_detect/src/core/services/device/device_service.dart';
import 'package:derma_detect/src/core/services/network/dio/base_dio.dart';
import 'package:derma_detect/src/core/services/network/dio/dio_client_impl.dart';
import 'package:derma_detect/src/core/services/network/network_service.dart';
import 'package:derma_detect/src/core/utils/shared_navigator.dart';
import 'package:derma_detect/src/modules/auth/login_module.dart';
import 'package:derma_detect/src/modules/main/main_module.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/presentation/submodules/about/about_module.dart';
import 'package:derma_detect/src/modules/splash/splash_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppModule extends Module {
  static const routePath = '';

  @override
  void binds(i) {
    // Navigator
    i.addLazySingleton(() => const SharedNavigator());

    //Datasource
    i.addLazySingleton<SharedLocalDatasource>(
      () => SharedLocalDatasourceImpl(
        flutterSecureStorage: const FlutterSecureStorage(),
      ),
    );

    //Repositorys
    i.addLazySingleton<SharedRepository>(() => SharedRepositoryImpl(localDatasource: i()));

    //Usecases
    i.addLazySingleton(() => SetTokenUsecase(repository: i()));
    i.addLazySingleton(() => GetTokenUsecase(repository: i()));

    //BaseDio
    i.add<BaseDio>(() => BaseDio());

    //Services
    i.addLazySingleton<NetworkService>(
      () => DioClientService(dio: i<BaseDio>()),
    );

    i.addLazySingleton<DeviceInfoService>(
      () => DeviceInfoServiceImpl(),
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
    r.module(
      AboutModule.moduleName,
      module: AboutModule(),
    );
  }
}
