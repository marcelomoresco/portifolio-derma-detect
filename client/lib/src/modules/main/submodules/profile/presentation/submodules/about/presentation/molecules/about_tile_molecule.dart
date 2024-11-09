import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:flutter/material.dart';

class AboutItemMolecule extends StatelessWidget {
  const AboutItemMolecule({
    super.key,
    required this.aboutItem,
  });

  final AboutItem aboutItem;

  @override
  Widget build(BuildContext context) {
    const lineHeight = 1.5;

    return InkWell(
      onTap: aboutItem.onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(aboutItem.icon),
          const SizedBox(width: kMarginDefault),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  aboutItem.title,
                  style: AppTextStyles.interRegular16.copyWith(
                    height: lineHeight,
                    color: Colors.black,
                  ),
                ),
                Text(
                  aboutItem.subText1,
                  style: AppTextStyles.interRegular12.copyWith(
                    height: lineHeight,
                    color: Colors.grey.shade600,
                  ),
                  softWrap: false,
                ),
                Text(
                  aboutItem.subText2,
                  style: AppTextStyles.interRegular12.copyWith(
                    height: lineHeight,
                    color: Colors.grey.shade600,
                  ),
                  softWrap: false,
                ),
              ],
            ),
          ),
          if (aboutItem.onTap != null)
            const Icon(
              Icons.chevron_right_rounded,
              color: Colors.black,
            ),
        ],
      ),
    );
  }
}

class AboutItem {
  AboutItem({
    required this.icon,
    required this.title,
    required this.subText1,
    required this.subText2,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String subText1;
  final String subText2;
  final void Function()? onTap;
}
