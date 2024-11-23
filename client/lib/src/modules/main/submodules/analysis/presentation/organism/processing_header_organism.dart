import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ProcessingHeaderOrganism extends StatelessWidget {
  const ProcessingHeaderOrganism({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 60,
          right: kMarginDefault,
          left: kMarginDefault,
          bottom: kMarginDefault,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(kCornerMedium)),
              child: LinearProgressIndicator(
                minHeight: 4,
                backgroundColor: Colors.grey.shade200,
                color: context.colors.primary,
              ),
            ),
            const SizedBox(height: kMarginDefault),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Aguardando processamento",
                      style: AppTextStyles.interSemiBold14,
                    ),
                    Text(
                      "Atualizado em tempo real...",
                      style: AppTextStyles.interRegular12,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
