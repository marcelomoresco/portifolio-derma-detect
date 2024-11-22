import 'package:derma_detect/src/app_module.dart';
import 'package:derma_detect/src/modules/main/main_module.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/data/datasource/analysis_remote_datasource.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/data/repository/analysis_repository_impl.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/repository/analysis_repository.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/usecases/create_analyse_usecase.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/usecases/get_all_analysis_usecase.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/usecases/get_by_id_analyse_usecase.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/cubits/analysis_cubit.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/cubits/analysis_detail_cubit.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/cubits/analyze_processing_cubit.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/cubits/onboarding_new_analysis_cubit.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/pages/analysis_detail_page.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/pages/analysis_page.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/pages/analyze_processing_page.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/pages/onboarding_new_analysis_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AnalysisSubmodule extends Module {
  static const moduleName = '/analysis';
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
    i.addLazySingleton(() => GetAllAnalysisUsecase(repository: i()));
    i.addLazySingleton(() => GetByIdAnalysisUsecase(repository: i()));
    i.addLazySingleton(() => CreateAnalysisUsecase(repository: i()));

    //Cubits
    i.addLazySingleton(
      () => AnalysisCubit(
        sharedNavigator: i(),
        getAllAnalysisUsecase: i(),
      ),
    );

    i.addLazySingleton(
      () => OnboardingNewAnalysisCubit(
        sharedNavigator: i(),
        permissionManager: i(),
      ),
    );

    i.add(
      () => AnalyzeProcessingCubit(
        sharedNavigator: i(),
        createAnalysisUsecase: i(),
        params: i.args.data,
      ),
    );

    i.add(
      () => AnalysisDetailCubit(
        sharedNavigator: i(),
        getByIdAnalysisUsecase: i(),
        params: i.args.data,
      ),
    );
  }

  static void analysisRoutes(
    RouteManager r,
  ) {
    r.child(
      AnalysisPage.routeName,
      child: (_) => const AnalysisPage(),
    );
    r.child(
      AnalysisDetailPage.routeName,
      child: (_) => const AnalysisDetailPage(),
    );
    r.child(
      AnalysisProcessingPage.routeName,
      child: (_) => const AnalysisProcessingPage(),
    );
    r.child(
      OnboardingNewAnalysisPage.routeName,
      child: (_) => const OnboardingNewAnalysisPage(),
    );
  }
}
