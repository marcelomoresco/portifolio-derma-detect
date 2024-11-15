import 'package:derma_detect/src/core/helpers/derma_cubit_state.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/presentation/submodules/faq/presentation/templates/faq_question_list_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../faq_module.dart';
import '../cubits/faq_category_cubit.dart';

class FaqCategoryPage extends StatefulWidget {
  const FaqCategoryPage({super.key});
  static const routeName = '/faq_category';
  static const routePath = FaqModule.routePath + routeName;

  @override
  State<FaqCategoryPage> createState() => _FaqCategoryPageState();
}

class _FaqCategoryPageState extends DermaCubitState<FaqCategoryPage, FaqCategoryCubit> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FaqCategoryCubit, FaqCategoryState>(
      bloc: cubit,
      builder: (context, state) {
        return FaqQuestionsListTemplate(
          category: cubit.faqCategoryName,
          faqQuestionItensList: state.faqCategory?.faqQuestionItensList ?? [],
        );
      },
    );
  }
}
