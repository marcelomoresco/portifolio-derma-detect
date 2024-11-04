import 'package:derma_detect/src/modules/main/main_module.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/pages/analysis_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AnalysisSubmodule extends Module {
  static const moduleName = '/analysis';
  static const routePath = MainModule.routePath + moduleName;

  @override
  void binds(i) {
    //Others
  }

  static void analysisRoutes(
    RouteManager r,
  ) {
    r.child(
      AnalysisPage.routeName,
      child: (_) => const AnalysisPage(),
    );
  }
}
