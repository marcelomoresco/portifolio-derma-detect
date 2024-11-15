import 'package:derma_detect/src/modules/main/submodules/home/domain/entities/faq_category.dart';
import 'package:derma_detect/src/modules/main/submodules/home/presentation/molecules/faq_item_molecule.dart';
import 'package:derma_detect/src/modules/main/submodules/home/presentation/organism/home_section.dart';
import 'package:flutter/material.dart';

class HomeFaqOrganism extends StatelessWidget {
  const HomeFaqOrganism({
    super.key,
    required this.title,
    required this.description,
    required this.faqCategories,
    required this.onTapFaqCategory,
  });
  final String title;
  final String description;
  final List<FaqCategory> faqCategories;
  final void Function(FaqCategory) onTapFaqCategory;

  @override
  Widget build(BuildContext context) {
    return faqCategories.isEmpty
        ? const SizedBox()
        : HomeGenericSectionOrganism(
            title: title,
            description: description,
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: faqCategories.length,
              itemBuilder: (context, index) {
                final faqCategory = faqCategories[index];

                return HomeFaqItemMolecule(
                  faqCategory: faqCategory,
                  onTap: () => onTapFaqCategory(faqCategory),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  thickness: 1.2,
                );
              },
            ),
          );
  }
}
