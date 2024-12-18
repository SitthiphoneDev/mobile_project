import 'package:flutter/material.dart';
import 'package:mobile_project/theme/app_colors.dart';

class AppThemes {
  static ThemeData main = ThemeData(
    colorScheme: _mainColorScheme,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
    ),
  );

  static final ColorScheme _mainColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.white,
    primary: AppColors.primaryPurple,
    onPrimary: AppColors.titleText,
    secondary: Colors.white,
    onSecondary: Colors.white,
    tertiary: Colors.white,
    onTertiary: Colors.white,
    surface: Colors.white,
    background: Colors.white,
  );
}
