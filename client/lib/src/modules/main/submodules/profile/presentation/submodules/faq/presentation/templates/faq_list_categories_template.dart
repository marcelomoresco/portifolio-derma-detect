import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/modules/main/submodules/home/domain/entities/faq_category.dart';
import 'package:derma_detect/src/modules/main/submodules/home/presentation/const/faq_home_app.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import '../organism/faq_list_categories_organism.dart';

class FaqListCategoriesTemplate extends StatelessWidget {
  const FaqListCategoriesTemplate({
    super.key,
    required this.isLoading,
    required this.openQuestion,
    required this.openCategory,
  });
  final bool isLoading;
  final VoidCallback openQuestion;
  final void Function(FaqCategory) openCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: context.colors.primary,
        centerTitle: true,
        title: Text(
          "Perguntas Frequentes",
          style: AppTextStyles.interMedium20,
        ),
        leading: InkWell(
          onTap: () {
            Modular.to.pop();
          },
          child: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(kMarginBig),
            const Divider(),
            FaqListCategoriesOrganism(
              openCategory: openCategory,
              faqCategoriesList: faqCategories,
            ),
          ],
        ),
      ),
    );
  }
}
