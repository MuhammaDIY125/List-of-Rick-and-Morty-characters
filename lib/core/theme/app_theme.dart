import 'package:flutter/material.dart';

import '/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.accent),
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.text,
        elevation: 0,
        centerTitle: true,
      ),
      cardTheme: const CardThemeData(
        color: AppColors.surface,
        elevation: 4,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.accent,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: AppColors.backgroundDark,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.surfaceDark,
        foregroundColor: AppColors.textDark,
        elevation: 0,
        centerTitle: true,
      ),
      cardTheme: const CardThemeData(
        color: AppColors.surfaceDark,
        elevation: 4,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }
}
