import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/core/widgets/molecules/custom_shimmer_widget.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/analysis.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/molecule/analyse_card_molecule.dart';
import 'package:derma_detect/src/modules/main/submodules/home/presentation/organism/home_section.dart';
import 'package:flutter/material.dart';

class HomeLastAnalysisOrganism extends StatelessWidget {
  const HomeLastAnalysisOrganism({
    super.key,
    required this.lastAnalysis,
    required this.openAnalysis,
    this.isLoading = false,
  });
  final List<Analysis> lastAnalysis;
  final void Function({Analysis analysis}) openAnalysis;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return CustomShimmerWidget(
      loading: isLoading,
      child: lastAnalysis.isEmpty
          ? const SizedBox()
          : HomeGenericSectionOrganism(
              title: "Últimas análises",
              description: "Confira os resultados mais recentes e acompanhe de perto sua saúde.",
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 1,
                separatorBuilder: (context, index) => const SizedBox(height: kMarginMedium),
                itemBuilder: (context, index) {
                  final item = lastAnalysis[index];
                  return AnalyseCardMolecule(
                    analysis: item,
                    onTap: () => openAnalysis(analysis: item),
                  );
                },
              ),
            ),
    );
  }
}
