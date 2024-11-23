// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/core/widgets/molecules/animated_switch_size_molecule.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeAnalysisAvaliableMolecule extends StatefulWidget {
  const HomeAnalysisAvaliableMolecule({
    super.key,
    required this.isLoading,
    required this.isAnalysisAvailable,
    required this.analysisQuantity,
    required this.onTapButton,
  });

  final bool isLoading;
  final bool isAnalysisAvailable;
  final int analysisQuantity;
  final VoidCallback? onTapButton;

  @override
  State<HomeAnalysisAvaliableMolecule> createState() => _HomeAnalysisAvaliableMoleculeState();
}

class _HomeAnalysisAvaliableMoleculeState extends State<HomeAnalysisAvaliableMolecule> {
  String get title => widget.isAnalysisAvailable //
      ? widget.analysisQuantity.toDouble().toStringAsFixed(2)
      : "Não disponível";

  final Duration durationAnimated = const Duration(milliseconds: 250);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedSwitcherSize(
                      alignment: Alignment.centerLeft,
                      duration: durationAnimated,
                      child: Text(
                        title,
                        key: ValueKey<String>(title),
                        style: AppTextStyles.interBold30.copyWith(
                          color: widget.isAnalysisAvailable ? Colors.black : Colors.grey.shade300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const Gap(kMarginDetail),
        Text(
          'Valor sujeito a alteração',
          style: AppTextStyles.interRegular12.copyWith(
            color: Colors.grey.shade500,
          ),
        ),
        const Gap(kMarginDefault),
        DermaButton(
          onPressed: widget.onTapButton,
          text: "Realizar análise",
          isEnable: widget.onTapButton != null,
        )
      ],
    );
  }
}
