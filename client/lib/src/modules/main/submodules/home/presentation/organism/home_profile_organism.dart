// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/modules/main/submodules/home/presentation/molecules/home_analysis_avaliable_organism.dart';
import 'package:derma_detect/src/modules/main/submodules/home/presentation/organism/home_section.dart';
import 'package:flutter/material.dart';

class HomeProfileOrganism extends StatelessWidget {
  const HomeProfileOrganism({
    super.key,
    required this.isAnalysisAvailable,
    required this.isLoading,
    required this.analysisQuantity,
    required this.onTapQuestion,
    required this.onTapButton,
  });
  final bool isAnalysisAvailable;
  final bool isLoading;
  final int analysisQuantity;
  final VoidCallback onTapQuestion;
  final VoidCallback? onTapButton;

  @override
  Widget build(BuildContext context) {
    return HomeGenericSectionOrganism(
      title: "Análises Diárias",
      description: 'Descubra informações valiosas sobre sua pele em segundos!',
      onTapQuestion: onTapQuestion,
      spacing: kMarginSmall,
      child: HomeAnalysisAvaliableMolecule(
        isAnalysisAvailable: isAnalysisAvailable,
        isLoading: isLoading,
        analysisQuantity: analysisQuantity,
        onTapButton: onTapButton,
      ),
    );
  }
}
