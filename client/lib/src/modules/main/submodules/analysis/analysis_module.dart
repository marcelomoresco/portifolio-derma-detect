import 'package:derma_detect/src/modules/main/main_module.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/cubits/analysis_cubit.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/pages/analysis_page.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/pages/onboarding_new_analysis_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AnalysisSubmodule extends Module {
  static const moduleName = '/analysis';
  static const routePath = MainModule.routePath + moduleName;

  @override
  void binds(i) {
    //Cubits
    i.addLazySingleton(
      () => AnalysisCubit(
        sharedNavigator: i(),
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
      OnboardingNewAnalysisPage.routeName,
      child: (_) => const OnboardingNewAnalysisPage(),
    );
  }
}
