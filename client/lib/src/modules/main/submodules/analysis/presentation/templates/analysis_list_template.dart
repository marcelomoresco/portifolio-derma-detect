// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:derma_detect/src/core/consts/app_assets.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/core/utils/shared_navigator.dart';
import 'package:derma_detect/src/core/utils/status.dart';
import 'package:derma_detect/src/core/widgets/molecules/derma_card.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/analysis.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/organism/analysis_list_organism.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/organism/empty_analysis_organism.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class AnalysisListTemplate extends StatelessWidget {
  const AnalysisListTemplate({
    super.key,
    required this.onTapNewAnalyze,
    required this.onRefresh,
    required this.analysis,
    required this.analysisStatus,
    required this.onTapAnalysis,
  });
  final VoidCallback onTapNewAnalyze;
  final Future<void> Function() onRefresh;
  final List<Analysis> analysis;
  final Status analysisStatus;
  final Function(Analysis) onTapAnalysis;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          final shared = Modular.get<SharedNavigator>();
          shared.openOnboardingAnalyze();
        },
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView(
            children: [
              const Gap(kMarginDefault),
              DermaCard(
                icon: Lottie.asset(AppAssets.dermaAnimation, height: 90),
                title: "Nova análise!",
                description: "Descubra os sinais da sua pele agora mesmo.",
                onTap: onTapNewAnalyze,
              ),
              Gap(analysis.isEmpty ? kMarginBig * 2 : kMarginDefault),
              if (analysis.isEmpty) ...[
                const EmptyAnalysisOrganism(),
              ] else ...[
                AnalysisListOrganism(
                  analyses: analysis,
                  onTapAnalysis: onTapAnalysis,
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
