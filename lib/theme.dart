import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AppColors {
  static const primary = Color(0xFF3D5AFE);     // Indigo Blue
  static const accent = Color(0xFF536DFE);
  static const title = Color(0xFF1D1D1F);
  static const hint = Color(0xFF8A8A8E);
  static const border = Color(0xFFCCCCCC);
}

class AppTheme {
  static final light = ThemeData(
    // fontFamily: 'disney',
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    textTheme: GoogleFonts.interTextTheme(),
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.accent,
    ),
  );
  static final dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
  );
}
