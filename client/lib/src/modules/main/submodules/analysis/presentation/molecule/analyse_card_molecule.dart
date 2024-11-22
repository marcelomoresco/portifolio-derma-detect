import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/analysis.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class AnalyseCardMolecule extends StatelessWidget {
  const AnalyseCardMolecule({
    super.key,
    required this.analysis,
  });
  final Analysis analysis;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
              const Column(
                children: [Text('')],
              ),
            ],
          ),
          const Icon(Icons.chevron_right)
        ],
      ),
    );
  }
}
