import 'package:design_system/src/core/colors/icolor.dart';
import 'package:flutter/material.dart';

extension ContextThemeExtension on BuildContext {
  IColors get colors => Theme.of(this).extension<IColors>()!;
}
