import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/data/model/disease_category_model.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/analysis.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/atoms/risk_status_atom.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class AnalyseCardMolecule extends StatelessWidget {
  const AnalyseCardMolecule({
    super.key,
    required this.analysis,
    required this.onTap,
  });
  final Analysis analysis;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(kMarginDefault),
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(kMarginDefault),
          border: Border.all(
            width: 1.5,
            color: context.colors.primary!,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: kMarginDefault,
          vertical: kMarginNormal,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (analysis.riskLevel != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Risco: ',
                    style: AppTextStyles.interBold14,
                  ),
                  const Gap(kMarginDetail),
                  RiskStatusAtom(riskStatus: analysis.riskLevel!),
                ],
              ),
            const Gap(kMarginSmall),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: context.colors.primary,
                      child: const Padding(
                        padding: EdgeInsets.all(kMarginSmall),
                        child: Icon(
                          FontAwesomeIcons.microscope,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                    ),
                    const Gap(kMarginSmall),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (analysis.diseaseCategory != null)
                          Text(
                            DiseaseCategoryMapper.translate(analysis.diseaseCategory!) ?? '',
                            style: AppTextStyles.interSemiBold18,
                          ),
                        const Gap(kMarginDetail),
                        Row(
                          children: [
                            Text(
                              "Probabilidade: ",
                              style: AppTextStyles.interRegular14,
                            ),
                            Text(
                              "${(analysis.confidence! * 100).toStringAsFixed(2)}%",
                              style: AppTextStyles.interSemiBold14,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const Icon(Icons.chevron_right)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
