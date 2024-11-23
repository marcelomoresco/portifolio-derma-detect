import 'package:derma_detect/src/core/consts/app_assets.dart';
import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class SingleFieldTemplate extends StatelessWidget {
  const SingleFieldTemplate({
    super.key,
    required this.title,
    required this.subtitle,
    required this.fieldComponent,
    required this.buttonMoleculeOld,
    this.showLogo = true,
    this.showBackButton = true,
    this.onBackButtonTap,
    this.shouldShowBackButtonLabel = true,
    this.backgroundColor,
  });
  final String title;
  final String subtitle;
  final List<Widget> fieldComponent;
  final List<Widget> buttonMoleculeOld;
  final bool showLogo;
  final bool showBackButton;
  final VoidCallback? onBackButtonTap;
  final bool shouldShowBackButtonLabel;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBarMolecule(
        showBackButton: showBackButton,
        elevation: 0,
        onBackButtonTap: onBackButtonTap,
        shouldShowBackButtonLabel: shouldShowBackButtonLabel,
      ),
      backgroundColor: backgroundColor ?? context.colors.neutralWhite,
      body: ExpandedScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kMarginDefault),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (showLogo) ...[
                  const SizedBox(height: kMarginMedium),
                  Image.asset(
                    AppAssets.logoWithBackground,
                    height: 50,
                  ),
                  const SizedBox(height: kMarginMedium),
                ],
                Text(
                  title,
                  style: AppTextStyles.ralewaySemiBold24.copyWith(
                    color: context.colors.background,
                  ),
                ),
                const SizedBox(height: kMarginSmall),
                Text(
                  subtitle,
                  style: AppTextStyles.ralewayRegular14.copyWith(),
                ),
                const SizedBox(height: kMarginBig * 2),
                const Spacer(),
                ...fieldComponent,
                const SizedBox(height: kMarginBig + kMarginSmall),
                ...buttonMoleculeOld,
                const SizedBox(height: kMarginDefault),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
