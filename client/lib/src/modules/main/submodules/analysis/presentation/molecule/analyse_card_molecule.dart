import 'package:auto_size_text/auto_size_text.dart';
import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/data/model/disease_category_model.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/analysis.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/atoms/date_atom.dart';
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
                    'Data: ',
                    style: AppTextStyles.interBold14,
                  ),
                  const Gap(kMarginDetail),
                  DateAtom(date: analysis.createdAt ?? DateTime.now()),
                ],
              ),
            const Gap(kMarginSmall),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
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
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (analysis.diseaseCategory != null)
                              AutoSizeText(
                                DiseaseCategoryMapper.translate(analysis.diseaseCategory!) ?? '',
                                style: AppTextStyles.interSemiBold18,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                minFontSize: 12,
                              ),
                            const Gap(kMarginDetail),
                            Row(
                              children: [
                                Text(
                                  "Probabilidade: ",
                                  style: AppTextStyles.interRegular14,
                                ),
                                Flexible(
                                  child: Text(
                                    "${(analysis.confidence! * 100).toStringAsFixed(2)}%",
                                    style: AppTextStyles.interSemiBold14,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
