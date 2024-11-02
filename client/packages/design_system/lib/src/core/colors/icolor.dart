import 'package:flutter/material.dart';

class IColors extends ThemeExtension<IColors> {
  const IColors({
    required this.primary,
    required this.danger,
    required this.sucess,
    required this.warning,
    required this.background,
    required this.fgDefault,
    required this.secodary,
    required this.backgroundSecondary,
    required this.neutralWhite,
  });

  final Color? primary;
  final Color? danger;
  final Color? warning;
  final Color? sucess;
  final Color? background;
  final Color? fgDefault;
  final Color? secodary;
  final Color? backgroundSecondary;
  final Color? neutralWhite;

  @override
  IColors copyWith({
    Color? primary,
    Color? danger,
    Color? warning,
    Color? sucess,
    Color? background,
    Color? fgDefault,
    Color? secodary,
    Color? backgroundSecondary,
    Color? neutralWhite,
  }) {
    return IColors(
      primary: primary ?? this.primary,
      danger: danger ?? this.danger,
      warning: warning ?? this.warning,
      sucess: sucess ?? this.sucess,
      background: background ?? this.background,
      fgDefault: fgDefault ?? this.fgDefault,
      secodary: secodary ?? this.secodary,
      backgroundSecondary: backgroundSecondary ?? this.backgroundSecondary,
      neutralWhite: neutralWhite ?? this.neutralWhite,
    );
  }

  @override
  IColors lerp(IColors? other, double t) {
    if (other is! IColors) {
      return this;
    }

    return IColors(
      danger: Color.lerp(danger, other.danger, t),
      background: null,
      warning: warning,
      sucess: null,
      secodary: null,
      fgDefault: null,
      primary: null,
      backgroundSecondary: null,
      neutralWhite: null,
    );
  }
}
