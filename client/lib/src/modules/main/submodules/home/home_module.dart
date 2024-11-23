import 'package:derma_detect/src/app_module.dart';
import 'package:derma_detect/src/modules/main/main_module.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/data/datasource/analysis_remote_datasource.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/data/repository/analysis_repository_impl.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/repository/analysis_repository.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/usecases/get_recents_analysis_usecase.dart';
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
    //Others
    i.addLazySingleton<AnalysisRemoteDatasource>(
      () => AnalysisRemoteDatasourceImpl(
        networkService: i(),
      ),
    );

    //Repositorys
    i.addLazySingleton<AnalysisRepository>(() => AnalysisRepositoryImpl(datasource: i()));

    //Usecases
    i.addLazySingleton(() => GetRecentsAnalysisUsecase(repository: i()));

    //Cubits
    i.addLazySingleton(
      () => HomeCubit(
        sharedNavigator: i(),
        getUserProfileUsecase: i(),
        getRecentsAnalysisUsecase: i(),
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
