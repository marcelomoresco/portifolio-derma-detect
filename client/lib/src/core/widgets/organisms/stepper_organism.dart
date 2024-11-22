import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/core/widgets/atoms/progress_bar_atom.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class StepperAtom extends StatelessWidget {
  const StepperAtom({
    super.key,
    required this.total,
    required this.actualValue,
  });
  final int total;
  final int actualValue;

  String get formattedTotal => total.toString().padLeft(2, '0');
  String get formattedActualValue => actualValue.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMarginDefault),
      child: Column(
        children: [
          const Gap(kMarginSmall),
          Row(
            children: [
              Expanded(
                child: ProgressBarAtom(
                  total: total,
                  actualValue: actualValue,
                  progressChangeColor: false,
                  showBorderRadius: true,
                ),
              ),
              const Gap(kMarginSmall),
              Text(
                '$formattedActualValue de $formattedTotal',
                style: AppTextStyles.interRegular14.copyWith(
                  color: Colors.grey.shade300,
                ),
              ),
            ],
          ),
          const Gap(kMarginSmall),
        ],
      ),
    );
  }
}
