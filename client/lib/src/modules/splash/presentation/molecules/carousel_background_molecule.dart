import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/modules/splash/presentation/atoms/carousel_text.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class CarouselBackgroundMolecule extends StatelessWidget {
  const CarouselBackgroundMolecule({
    super.key,
    required this.carouselContent,
    required this.currentPage,
    required this.textBottomOffset,
  });

  final List<CarouselContent> carouselContent;
  final int currentPage;
  final double textBottomOffset;

  @override
  Widget build(BuildContext context) {
    final currentContent = carouselContent[currentPage];

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 1000),
      transitionBuilder: (child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: Container(
        key: ObjectKey(currentContent),
        decoration: BoxDecoration(
          color: context.colors.neutralWhite,
          image: DecorationImage(
            image: AssetImage(currentContent.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: kMarginDefault,
            right: kMarginDefault,
            bottom: textBottomOffset,
            top: kMarginDefault,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CarouselTextMolecule(
                title: currentContent.title,
                titleWidget: currentContent.titleWidget,
                padding: currentContent.padding,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CarouselContent {
  const CarouselContent({
    required this.image,
    this.title,
    this.titleWidget,
    this.padding,
  });

  final String image;
  final String? title;
  final Widget? titleWidget;
  final EdgeInsetsGeometry? padding;
}
