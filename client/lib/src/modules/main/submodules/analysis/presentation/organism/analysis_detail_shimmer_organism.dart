import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/core/widgets/molecules/container_shimmer_molecule.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AnalysisDetailShimmerOrganism extends StatelessWidget {
  const AnalysisDetailShimmerOrganism({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(kMarginBig),
        const ContainerShimmerMolecule(
          height: 30,
          width: 130,
        ),
        const Gap(kMarginDefault),
        SizedBox(
          height: 350,
          child: ListView.separated(
            itemCount: 7,
            itemBuilder: (context, index) {
              return const ContainerShimmerMolecule(
                height: 30,
                width: 130,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: kMarginDefault),
          ),
        ),
      ],
    );
  }
}
