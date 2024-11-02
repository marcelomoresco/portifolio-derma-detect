import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/modules/splash/presentation/atoms/carousel_progress_bar_atom.dart';
import 'package:flutter/material.dart';

class CarouselProgressBarMolecule extends StatelessWidget {
  const CarouselProgressBarMolecule({
    super.key,
    required this.totalPages,
    required this.currentPage,
    required this.duration,
  });
  final int totalPages;
  final int currentPage;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final totalWidth = MediaQuery.of(context).size.width - 2 * kMarginDefault;

    return SizedBox(
      width: totalWidth,
      height: 4,
      child: ListView.separated(
        itemCount: totalPages,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final progressBarAtomWidth = (totalWidth / totalPages) - kMarginSmall / 2 - 2;
          return SizedBox(
            width: progressBarAtomWidth,
            child: CarouselProgressBarAtom(
              active: index == currentPage,
              width: progressBarAtomWidth,
              duration: duration,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: kMarginSmall);
        },
      ),
    );
  }
}
