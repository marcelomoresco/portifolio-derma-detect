import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:flutter/material.dart';

class ImageBannerMolecule extends StatelessWidget {
  const ImageBannerMolecule({
    super.key,
    required this.onTap,
    this.height,
    this.width,
    this.cornerEnabled = false,
    required this.padding,
    required this.assetName,
  });

  final VoidCallback onTap;
  final double? height;
  final double? width;
  final bool cornerEnabled;
  final EdgeInsets padding;
  final String assetName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(kCornerBig),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kCornerBig),
            ),
            child: Image.asset(assetName),
          ),
        ),
      ),
    );
  }
}
