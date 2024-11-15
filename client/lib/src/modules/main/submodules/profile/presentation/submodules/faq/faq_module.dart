import 'package:derma_detect/src/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/cubits/faq_category_cubit.dart';
import 'presentation/pages/faq_category_page.dart';

import 'presentation/pages/faq_list_categories_page.dart';

class FaqModule extends Module {
  static const moduleName = '/faq-module';
  static const routePath = AppModule.routePath + moduleName;

  @override
  void binds(i) {
    // Cubits

    // i.addLazySingleton(
    //   () => FaqListCategoriesCubit(
    //     faqNavigator: i(),
    //     getFaqCategoriesUsecase: i(),
    //   ),
    // );

    i.addLazySingleton(
      () => FaqCategoryCubit(
        faqCategory: i.args.data,
      ),
    );
  }

  @override
  void routes(r) {
    r.redirect(
      FaqModule.routePath,
      to: FaqListCategoriesPage.routePath,
    );
    r.child(
      FaqListCategoriesPage.routeName,
      child: (_) => const FaqListCategoriesPage(),
    );
    r.child(
      FaqCategoryPage.routeName,
      child: (_) => const FaqCategoryPage(),
    );
  }
}
