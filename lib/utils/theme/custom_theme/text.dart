import 'package:flutter/material.dart';

class AppTextTheme {
  AppTextTheme._();

  static const Color _lightThemeTextColors = Colors.black;
  static const Color _darkThemeTextColors = Colors.white;

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.bold,
      color: _lightThemeTextColors,
    ),
    headlineMedium: const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: _lightThemeTextColors,
    ),
    headlineSmall: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: _lightThemeTextColors,
    ),
    titleLarge: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: _lightThemeTextColors,
    ),
    titleMedium: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: _lightThemeTextColors,
    ),
    titleSmall: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: _lightThemeTextColors,
    ),
    bodyLarge: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: _lightThemeTextColors,
    ),
    bodyMedium: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: _lightThemeTextColors,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: _lightThemeTextColors.withOpacity(0.5),
    ),
    labelLarge: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: _lightThemeTextColors,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: _lightThemeTextColors.withOpacity(0.5),
    ),
  );
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: _darkThemeTextColors,
    ),
    headlineMedium: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: _darkThemeTextColors,
    ),
    headlineSmall: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: _darkThemeTextColors,
    ),
    titleLarge: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: _darkThemeTextColors,
    ),
    titleMedium: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: _darkThemeTextColors,
    ),
    titleSmall: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: _darkThemeTextColors,
    ),
    bodyLarge: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: _darkThemeTextColors,
    ),
    bodyMedium: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: _darkThemeTextColors,
    ),
    bodySmall: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: _darkThemeTextColors,
    ),
    labelLarge: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: _darkThemeTextColors.withOpacity(0.5),
    ),
    labelMedium: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: _darkThemeTextColors,
    ),
  );
}
