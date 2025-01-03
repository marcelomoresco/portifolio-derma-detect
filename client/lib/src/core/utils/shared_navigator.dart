import 'dart:io';

import 'package:derma_detect/src/modules/auth/login_module.dart';
import 'package:derma_detect/src/modules/auth/presentation/pages/register_page.dart';
import 'package:derma_detect/src/modules/main/main_module.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/analysis.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/cubits/analysis_detail_cubit.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/cubits/analyze_processing_cubit.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/pages/analysis_detail_page.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/pages/analyze_processing_page.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/pages/onboarding_new_analysis_page.dart';
import 'package:derma_detect/src/modules/main/submodules/home/domain/entities/faq_category.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/presentation/submodules/faq/presentation/pages/faq_category_page.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/presentation/submodules/faq/presentation/pages/faq_list_categories_page.dart';
import 'package:derma_detect/src/modules/splash/splash_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SharedNavigator {
  const SharedNavigator();

  void openLogin() {
    Modular.to.navigate(LoginModule.moduleName);
  }

  void openRegister() {
    Modular.to.pushNamed(RegisterPage.routePath);
  }

  void openMain() {
    Modular.to.navigate(
      MainModule.moduleName,
    );
  }

  void openFirstAccessModule() {
    Modular.to.navigate(SplashModule.moduleName);
  }

  void openFaqByCategoryPage(FaqCategory faqCategory) {
    Modular.to.pushNamed(
      FaqCategoryPage.routePath,
      arguments: faqCategory,
    );
  }

  void openOnboardingAnalyze() {
    Modular.to.pushNamed(
      OnboardingNewAnalysisPage.routePath,
    );
  }

  void openDetailAnalysis(Analysis analysis) {
    Modular.to.pushNamed(
      AnalysisDetailPage.routePath,
      arguments: AnalysisDetailCubitParams(analysis: analysis),
    );
  }

  void openQuestions() {
    Modular.to.pushNamed(
      FaqListCategoriesPage.routePath,
    );
  }

  void openAnalyzeProcessing(File file) {
    Modular.to.pushNamed(
      AnalysisProcessingPage.routePath,
      arguments: AnalyzeProcessingCubitParams(
        file: file,
      ),
    );
  }
}
