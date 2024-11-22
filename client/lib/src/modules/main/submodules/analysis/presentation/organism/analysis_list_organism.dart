import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/analysis.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/molecule/analyse_card_molecule.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class AnalysisListOrganism extends StatelessWidget {
  const AnalysisListOrganism({
    super.key,
    required this.analyses,
  });
  final List<Analysis> analyses;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kMarginDefault),
          child: Text(
            'Suas Análises',
            style: AppTextStyles.interSemiBold20,
          ),
        ),
        const Gap(kMarginDefault),
        SizedBox(
          height: 1000,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: kMarginDefault),
            itemCount: analyses.length,
            itemBuilder: (context, index) {
              final item = analyses[index];
              return AnalyseCardMolecule(
                analysis: item,
              );
            },
            separatorBuilder: (context, index) => const Gap(kMarginDefault),
          ),
        )
      ],
    );
  }
}
