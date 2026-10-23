import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const bg = Color(0xFF0B0B0B);
  static const card = Color(0xFF161616);
  static const yellow = Color(0xFFFFE600);
  static const grey = Color(0xFF9A9A9A);
}

ThemeData buildTheme() {
  final base = ThemeData.dark(useMaterial3: true);
  return base.copyWith(
    scaffoldBackgroundColor: AppColors.bg,
    colorScheme: base.colorScheme.copyWith(primary: AppColors.yellow),
    textTheme: GoogleFonts.cairoTextTheme(base.textTheme),
  );
}
