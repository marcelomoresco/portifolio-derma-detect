import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/modules/main/submodules/home/domain/entities/faq_category.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FaqItemMoleculeModule extends StatelessWidget {
  const FaqItemMoleculeModule({
    super.key,
    required this.faqCategory,
    required this.onTap,
  });
  final FaqCategory faqCategory;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final hasDescription = faqCategory.description != null && faqCategory.description != '';

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: kMarginSmall,
          horizontal: kMarginDefault,
        ),
        child: Row(
          children: [
            Container(
              width: kMarginMedium,
              alignment: Alignment.center,
              child: const Icon(
                FontAwesomeIcons.circleQuestion,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: hasDescription ? EdgeInsets.zero : const EdgeInsets.symmetric(vertical: kMarginSmall),
                    child: Text(
                      faqCategory.categoryName,
                      style: AppTextStyles.interRegular16,
                    ),
                  ),
                  Visibility(
                    visible: hasDescription,
                    child: Column(
                      children: [
                        const SizedBox(height: kMarginDetail),
                        Text(
                          faqCategory.description ?? '',
                          style: AppTextStyles.interRegular12.copyWith(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
