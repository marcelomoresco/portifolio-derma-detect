import 'dart:convert';

import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/core/utils/status.dart';
import 'package:derma_detect/src/core/widgets/molecules/container_shimmer_molecule.dart';
import 'package:derma_detect/src/core/widgets/molecules/custom_shimmer_widget.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/data/model/disease_category_model.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/analysis.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/atoms/risk_status_atom.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/organism/analysis_detail_shimmer_organism.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gap/gap.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AnalysisDetailTemplate extends StatelessWidget {
  const AnalysisDetailTemplate({
    super.key,
    required this.analysis,
    required this.analysisStatus,
  });
  final Analysis analysis;
  final Status analysisStatus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMarginDefault),
      child: ListView(
        children: [
          const Gap(kMarginDefault),
          CustomShimmerWidget(
            loading: analysisStatus.isLoading,
            placeholder: const ContainerShimmerMolecule(
              height: 100,
            ),
            child: analysis.image == null
                ? const SizedBox.shrink()
                : ClipRRect(
                    borderRadius: BorderRadius.circular(
                      kCornerBig,
                    ),
                    child: Image.memory(
                      base64Decode(analysis.image!),
                      fit: BoxFit.fill,
                    ),
                  ),
          ),
          const Gap(kMarginMedium),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: AutoSizeText(
                      DiseaseCategoryMapper.translate(analysis.diseaseCategory!) ?? '',
                      style: AppTextStyles.interSemiBold24,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      minFontSize: 12,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Risco: ',
                        style: AppTextStyles.interRegular16,
                      ),
                      if (analysis.riskLevel != null)
                        RiskStatusAtom(
                          riskStatus: analysis.riskLevel!,
                        )
                    ],
                  ),
                ],
              ),
              const Gap(kMarginSmall),
              Row(
                children: [
                  Text(
                    "Probabilidade: ",
                    style: AppTextStyles.interRegular18,
                  ),
                  Text(
                    "${(analysis.confidence! * 100).toStringAsFixed(2)}%",
                    style: AppTextStyles.interSemiBold18,
                  ),
                ],
              ),
              CustomShimmerWidget(
                loading: analysisStatus.isLoading,
                placeholder: const AnalysisDetailShimmerOrganism(),
                child: analysis.promptGenerated == null
                    ? const SizedBox.shrink()
                    : Html(
                        data: analysis.promptGenerated,
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
