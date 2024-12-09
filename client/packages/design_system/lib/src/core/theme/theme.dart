import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData theme = ThemeData.light(useMaterial3: false).copyWith(
    textTheme: GoogleFonts.ralewayTextTheme(
      ThemeData.light().textTheme,
    ),
    primaryColor: const Color(0xFFC1D4CE),
    bottomSheetTheme: const BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
    ),
    extensions: [
      const IColors(
        primary: Color(0xFFC1D4CE),
        danger: Color(0xFFFF0010),
        warning: Color(0xFFFF9A00),
        background: Color(0xFF000000),
        sucess: Color(0XFF009456),
        secodary: Color(0xFF2C2C2C),
        fgDefault: Color(0xFFFFFFFF),
        backgroundSecondary: Color(0xFF1F222A),
        neutralWhite: Colors.white,
        backgroundTertiary: Color(0xFFEAECEE),
      )
    ],
  );
}
