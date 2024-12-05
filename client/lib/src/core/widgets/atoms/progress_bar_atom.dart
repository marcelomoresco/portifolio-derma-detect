import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:flutter/material.dart';

class ProgressBarAtom extends StatelessWidget {
  const ProgressBarAtom({
    super.key,
    required this.total,
    required this.actualValue,
    this.animatedDuration = 300,
    this.progressChangeColor = false,
    this.backgroundColor,
    this.barColor,
    this.showBorderRadius = false,
    this.animationDuration,
  });
  final int total;
  final int actualValue;
  final int animatedDuration;
  final bool progressChangeColor;
  final Color? backgroundColor;
  final Color? barColor;
  final bool showBorderRadius;
  final Duration? animationDuration;

  double get progress => actualValue / total;

  final double barHeight = 8;
  final double mediumProgress = 0.6;
  final double fullProgress = 1;

  @override
  Widget build(BuildContext context) {
    final progressWidth = progress * (MediaQuery.of(context).size.width - kMarginBig);
    return Container(
      height: barHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kCornerSmall),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: showBorderRadius
                  ? const BorderRadius.all(
                      Radius.circular(kMarginSmall),
                    )
                  : null,
              color: Colors.grey,
            ),
          ),
          AnimatedContainer(
            duration: animationDuration ?? Duration(milliseconds: animatedDuration),
            width: progressWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kCornerSmall),
              color: barColor ?? Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
