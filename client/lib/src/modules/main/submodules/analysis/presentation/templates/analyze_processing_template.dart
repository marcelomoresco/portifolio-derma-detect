import 'package:derma_detect/src/core/consts/app_assets.dart';
import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/organism/processing_header_organism.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class AnalyzeProcessingTemplate extends StatelessWidget {
  const AnalyzeProcessingTemplate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          top: false,
          child: Column(
            children: [
              const ProcessingHeaderOrganism(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(kMarginDefault),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        AppAssets.analyzeAnimation,
                        height: 270,
                      ),
                      const Gap(kMarginBig),
                      Text(
                        "Aguarde...",
                        style: AppTextStyles.interSemiBold20.copyWith(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: kMarginSmall),
                      Text(
                        "Este processamento pode durar alguns minutos, aguarde um pouco para visualizar o problema identificado",
                        style: AppTextStyles.interRegular14.copyWith(color: Colors.grey.shade500),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
