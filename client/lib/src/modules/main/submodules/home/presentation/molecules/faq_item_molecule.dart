import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/modules/main/submodules/home/domain/entities/faq_category.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeFaqItemMolecule extends StatelessWidget {
  const HomeFaqItemMolecule({
    super.key,
    required this.faqCategory,
    required this.onTap,
  });
  final FaqCategory faqCategory;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final hasDescription = faqCategory.description != null && faqCategory.description!.isNotEmpty;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(kCornerSmall),
      child: Row(
        children: [
          Container(
            width: kMarginBig,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(kCornerPill),
            ),
            padding: const EdgeInsets.all(kMarginDetail),
            child: const Icon(FontAwesomeIcons.circleQuestion),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: hasDescription ? MainAxisAlignment.start : MainAxisAlignment.center,
              children: [
                Text(
                  faqCategory.categoryName,
                  style: AppTextStyles.interMedium14.copyWith(color: Colors.black),
                ),
                Visibility(
                  visible: hasDescription,
                  child: Column(
                    children: [
                      const SizedBox(height: kMarginDetail),
                      Text(
                        faqCategory.description ?? '',
                        style: AppTextStyles.interRegular12.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          const Icon(Icons.chevron_right_outlined),
        ],
      ),
    );
  }
}
