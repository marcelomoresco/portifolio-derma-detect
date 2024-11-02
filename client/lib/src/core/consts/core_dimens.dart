import 'dart:ui';

import 'package:flutter/material.dart';

const double kMarginBig = 32.0;
const double kMarginMedium = 24.0;
const double kMarginDefault = 16.0;
const double kMarginNormal = 12.0;
const double kMarginSmall = 8.0;
const double kMarginDetail = 4.0;
const double kMarginExtraSmall = 2.0;

const double kButtonHeight = 50.0;

const double kCornerNone = 0.0;
const double kCornerSmall = 4.0;
const double kCornerDetail = 6.0;
const double kCornerMedium = 8.0;
const double kCornerBig = 16.0;
const double kCornerPill = 999.0;

const double kSpacingLg = 12.0;

const double kBorderWidthNone = 0.0;
const double kBorderWidthSmall = 1.0;
const double kBorderWidthMedium = 2.0;
const double kBorderWidthBig = 4.0;

const double kOpacityOpaque = 0.72;
const double kOpacityMedium = 0.40;
const double kOpacityLight = 0.24;

const double kElevationDefault = 4.0;

const double font12 = 14.0;

class CoreDimens {
  static const double _prototypeWidth = 375.0;
  static const double _prototypeHeight = 812.0;

  static double availableHeight(BuildContext context) {
    final totalScreenHeight = MediaQuery.of(context).size.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final bottomPaddingHeight = MediaQuery.of(context).padding.bottom;
    return totalScreenHeight - statusBarHeight - bottomPaddingHeight;
  }

  static double proportionalWidth(BuildContext context, double inputWidth) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return deviceWidth * inputWidth / _prototypeWidth;
  }

  static double proportionalHeight(BuildContext context, double inputHeight) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return deviceHeight * inputHeight / _prototypeHeight;
  }

  static EdgeInsets safeBottomPadding(EdgeInsets padding) {
    return padding.copyWith(bottom: window.viewPadding.bottom == 0 ? padding.bottom : 0.0);
  }
}
