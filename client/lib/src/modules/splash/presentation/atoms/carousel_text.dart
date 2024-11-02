import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class CarouselTextMolecule extends StatelessWidget {
  const CarouselTextMolecule({
    super.key,
    this.title,
    this.titleWidget,
    this.description,
    this.padding,
  }) : assert(titleWidget != null || title != null);

  final String? title;
  final Widget? titleWidget;
  final String? description;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: kMarginBig),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            titleWidget ??
                Text(
                  title ?? '',
                  textAlign: TextAlign.center,
                  style: titleTextStyle,
                ),
            if (description != null) ...[
              const SizedBox(height: kMarginDefault),
              Text(
                description!,
                textAlign: TextAlign.center,
                style: AppTextStyles.interRegular16.copyWith(
                  height: 1.2,
                  color: context.colors.neutralWhite,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  static TextStyle get titleTextStyle => AppTextStyles.interSemiBold36.copyWith(
        height: 1.2,
        color: Colors.white,
      );
}
