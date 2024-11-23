// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/core/utils/status.dart';
import 'package:derma_detect/src/core/widgets/molecules/custom_shimmer_widget.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/analysis.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/molecule/analyse_card_molecule.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/organism/analysis_list_shimmer_organism.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class AnalysisListOrganism extends StatelessWidget {
  const AnalysisListOrganism({
    super.key,
    required this.analyses,
    required this.onTapAnalysis,
    required this.analysisStatus,
  });
  final List<Analysis> analyses;
  final Function(Analysis) onTapAnalysis;
  final Status analysisStatus;

  @override
  Widget build(BuildContext context) {
    return CustomShimmerWidget(
      loading: analysisStatus.isLoading,
      placeholder: const AnalysisListShimmerOrganism(),
      child: Column(
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
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: kMarginDefault),
            itemCount: analyses.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final item = analyses[index];
              return AnalyseCardMolecule(
                analysis: item,
                onTap: () => onTapAnalysis(item),
              );
            },
            separatorBuilder: (context, index) => const Gap(kMarginDefault),
          ),
          const Gap(kMarginBig),
        ],
      ),
    );
  }
}
