import 'package:derma_detect/src/core/consts/app_assets.dart';
import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class EmptyAnalysisOrganism extends StatelessWidget {
  const EmptyAnalysisOrganism({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMarginDefault),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            AppAssets.emptyAnimation,
            height: 180,
          ),
          const Gap(kMarginDefault),
          Text(
            'Nenhuma análise',
            style: AppTextStyles.interSemiBold20,
          ),
          const Gap(kMarginSmall),
          Text(
            'Infelizmente você não possui nenhuma análise, faça já a sua',
            maxLines: 2,
            textAlign: TextAlign.center,
            style: AppTextStyles.interRegular16,
          ),
        ],
      ),
    );
  }
}
