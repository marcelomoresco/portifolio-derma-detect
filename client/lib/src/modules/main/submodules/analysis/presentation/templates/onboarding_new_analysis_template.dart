// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:derma_detect/src/core/consts/app_assets.dart';
import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class OnboardingNewAnalysisTemplate extends StatelessWidget {
  const OnboardingNewAnalysisTemplate({
    super.key,
    required this.onTapStarted,
  });
  final VoidCallback onTapStarted;

  @override
  Widget build(BuildContext context) {
    return ExpandedScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kMarginDefault),
          child: Stack(
            children: [
              Column(
                children: [
                  const Gap(kMarginBig * 1.5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        AppAssets.dermaAnimation,
                        height: 350,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Sua jornada para uma pele saudável começa aqui",
                    style: AppTextStyles.interSemiBold24,
                  ),
                  const Gap(kMarginDefault),
                  Text(
                    "Detecte sinais de problemas e descubra como cuidar melhor da sua pele.",
                    style: AppTextStyles.interRegular18,
                  ),
                  const Gap(kMarginDefault),
                  DermaButton(
                    onPressed: onTapStarted,
                    text: "Vamos começar!",
                    backgroundColor: context.colors.secodary,
                    isEnable: true,
                  ),
                  const Gap(kMarginBig),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
