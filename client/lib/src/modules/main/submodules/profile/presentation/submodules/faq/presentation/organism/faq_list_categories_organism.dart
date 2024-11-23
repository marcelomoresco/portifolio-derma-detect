import 'package:derma_detect/src/modules/main/submodules/home/domain/entities/faq_category.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/presentation/submodules/faq/presentation/molecule/faq_item_molecule.dart';
import 'package:flutter/material.dart';

class FaqListCategoriesOrganism extends StatelessWidget {
  const FaqListCategoriesOrganism({
    super.key,
    required this.faqCategoriesList,
    required this.openCategory,
  });
  final List<FaqCategory> faqCategoriesList;
  final void Function(FaqCategory) openCategory;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: faqCategoriesList.length,
      itemBuilder: (context, index) {
        final faqCategory = faqCategoriesList[index];

        return FaqItemMoleculeModule(
          faqCategory: faqCategory,
          onTap: () => openCategory(faqCategory),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }
}
