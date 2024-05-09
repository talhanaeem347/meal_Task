import 'package:meal_task/utils/constants/color.dart';
import 'package:flutter/material.dart';

class AppTextButtonTheme {
  AppTextButtonTheme._();

  static const Color foregroundColor = AppColors.primaryColor;
  static const Color backgroundColor = Colors.transparent;
  static const Color shadowColor = Colors.transparent;

  static TextButtonThemeData get lightTheme => TextButtonThemeData(
        style: TextButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor,
          visualDensity: VisualDensity.compact,
          shadowColor: shadowColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1.5,
            decoration: TextDecoration.underline,
            decorationThickness: 2,
            decorationColor: foregroundColor,
            decorationStyle: TextDecorationStyle.solid,
          ),
          foregroundColor: foregroundColor,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        ),
      );
}
