import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/modules/splash/presentation/organism/carousel_organism.dart';
import 'package:derma_detect/src/modules/splash/splash_strings.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../molecules/carousel_background_molecule.dart';

class WelcomeTemplate extends StatelessWidget {
  const WelcomeTemplate({
    super.key,
    required this.carouselContent,
    required this.onLoginTap,
    required this.onRegisterTap,
  });

  final List<CarouselContent> carouselContent;
  final VoidCallback onLoginTap;
  final VoidCallback onRegisterTap;

  final double carouselTextBottomOffset = (5 * kMarginBig) + widgetHeight;

  static const widgetHeight = (2 * 59) + kMarginDefault;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          CarouselOrganism(
            textBottomOffset: carouselTextBottomOffset,
            carouselContent: carouselContent,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(kMarginDefault),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(kMarginDefault),
                    decoration: BoxDecoration(
                      color: context.colors.neutralWhite,
                      borderRadius: BorderRadius.circular(
                        kMarginDefault,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          SplashStrings.attentionGrabbing,
                          style: AppTextStyles.ralewayRegular20,
                        ),
                        const Gap(kMarginDefault),
                        DermaOutlineButton(
                          text: SplashStrings.login,
                          onTap: onLoginTap,
                        ),
                        const Gap(kMarginSmall),
                        DermaButton(
                          onPressed: onRegisterTap,
                          text: SplashStrings.register,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
