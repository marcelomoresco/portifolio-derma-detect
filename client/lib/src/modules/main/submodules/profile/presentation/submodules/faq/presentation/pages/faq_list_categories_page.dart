import 'package:derma_detect/src/core/utils/shared_navigator.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/presentation/submodules/faq/faq_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../templates/faq_list_categories_template.dart';

class FaqListCategoriesPage extends StatelessWidget {
  const FaqListCategoriesPage({super.key});
  static const routeName = '/faq_list_categories';
  static const routePath = FaqModule.routePath + routeName;

  @override
  Widget build(BuildContext context) {
    return FaqListCategoriesTemplate(
      openCategory: (category) {
        final sharedNavigator = Modular.get<SharedNavigator>();
        sharedNavigator.openFaqByCategoryPage(category);
      },
      isLoading: false,
      openQuestion: () {},
    );
  }
}
