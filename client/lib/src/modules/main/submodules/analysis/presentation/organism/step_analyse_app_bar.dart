import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/core/widgets/organisms/stepper_organism.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class StepAnalyseAppBarMolecule extends StatelessWidget implements PreferredSizeWidget {
  const StepAnalyseAppBarMolecule({
    super.key,
    this.onTapBackButton,
    this.onTapCloseButton,
    required this.title,
    this.showBackButton = false,
    this.totalSteps = 7,
    this.actualValue = 1,
  });
  final VoidCallback? onTapBackButton;
  final VoidCallback? onTapCloseButton;
  final String title;
  final bool showBackButton;
  final int totalSteps;
  final int actualValue;

  @override
  Widget build(BuildContext context) {
    return SimpleAppBarMolecule(
      onBackButtonTap: onTapBackButton,
      onCloseButtonTap: onTapCloseButton,
      showBackButton: showBackButton,
      backgroundColor: Colors.white,
      elevation: 0.5,
      title: Text(
        title,
        style: AppTextStyles.interMedium20.copyWith(
          color: Colors.black,
        ),
      ),
      shapeBorder: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(kCornerBig),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(35),
        child: StepperAtom(
          total: totalSteps,
          actualValue: actualValue,
        ),
      ),
      shouldShowBackButtonLabel: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 35);
}
