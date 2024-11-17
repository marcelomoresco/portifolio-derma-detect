// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:derma_detect/src/core/consts/app_assets.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/core/utils/shared_navigator.dart';
import 'package:derma_detect/src/core/widgets/molecules/derma_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class AnalysisListTemplate extends StatelessWidget {
  const AnalysisListTemplate({
    super.key,
    required this.onTapNewAnalyze,
  });
  final VoidCallback onTapNewAnalyze;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          final shared = Modular.get<SharedNavigator>();
          shared.openOnboardingAnalyze();
        },
        child: Column(
          children: [
            const Gap(kMarginDefault),
            DermaCard(
              icon: Lottie.asset(AppAssets.dermaAnimation, height: 90),
              title: "Nova análise!",
              description: "Descubra os sinais da sua pele agora mesmo.",
              onTap: onTapNewAnalyze,
            ),
            const Gap(kMarginDefault),
          ],
        ),
      ),
    );
  }
}
