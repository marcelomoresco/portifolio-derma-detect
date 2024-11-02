import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WelcomeCardOrganism extends StatelessWidget {
  const WelcomeCardOrganism({
    super.key,
    required this.text,
    required this.onTap,
    this.background,
    this.secondColor,
  });
  final String text;
  final VoidCallback onTap;
  final Color? background;
  final Color? secondColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: background ?? context.colors.neutralWhite,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.email,
            color: secondColor ?? context.colors.background,
          ),
          const Gap(kMarginSmall),
          Text(
            text,
            style: AppTextStyles.interRegular14.copyWith(
              color: secondColor ?? context.colors.background,
            ),
          ),
        ],
      ),
    );
  }
}
