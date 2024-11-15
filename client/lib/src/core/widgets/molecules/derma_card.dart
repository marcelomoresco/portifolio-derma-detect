import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DermaCard extends StatelessWidget {
  const DermaCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });
  final Icon icon;
  final String title;
  final String description;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(kMarginDefault),
        margin: const EdgeInsets.symmetric(horizontal: kMarginDefault),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const Gap(kMarginSmall),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      style: AppTextStyles.interSemiBold14,
                    ),
                    Text(
                      description,
                      maxLines: 2,
                      style: AppTextStyles.interRegular12,
                    ),
                  ],
                )
              ],
            ),
            const Gap(kMarginSmall),
            //const Icon(Icons.chevron_right)
          ],
        ),
      ),
    );
  }
}
