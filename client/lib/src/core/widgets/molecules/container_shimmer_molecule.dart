import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:flutter/material.dart';

class ContainerShimmerMolecule extends StatelessWidget {
  const ContainerShimmerMolecule({
    super.key,
    this.radius = kCornerSmall,
    this.height = kMarginMedium,
    this.width,
  });

  final double radius;
  final double height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
