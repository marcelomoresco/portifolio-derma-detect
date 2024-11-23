import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/core/widgets/molecules/container_shimmer_molecule.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AnalysisListShimmerOrganism extends StatelessWidget {
  const AnalysisListShimmerOrganism({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: kMarginDefault),
          child: ContainerShimmerMolecule(
            height: 30,
            width: 130,
          ),
        ),
        const Gap(kMarginDefault),
        SizedBox(
          height: 1000,
          child: ListView.separated(
            itemCount: 11,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: kMarginDefault),
                child: ContainerShimmerMolecule(
                  height: 100,
                  width: double.infinity,
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: kMarginDefault),
          ),
        ),
      ],
    );
  }
}
