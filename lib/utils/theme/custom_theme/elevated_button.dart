import 'package:meal_task/utils/constants/color.dart';
import 'package:flutter/material.dart';

class AppElevatedButtonTheme {
  static const Color foregroundColorLightTheme = AppColors.textWhite;
  static const Color backgroundColorLightTheme = AppColors.primaryColor;
  static const Color shadowColorLightTheme = Colors.transparent;
  static const Color foregroundColorDarkTheme = AppColors.textWhite;
  static const Color backgroundColorDarkTheme = AppColors.primaryColor;
  static const Color shadowColorDarkTheme = Colors.transparent;

  AppElevatedButtonTheme._();

  static ElevatedButtonThemeData get lightTheme => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: foregroundColorLightTheme,
          backgroundColor: backgroundColorLightTheme,
          disabledBackgroundColor: Colors.grey,
          disabledForegroundColor: Colors.grey,
          side: const BorderSide(
            color: backgroundColorLightTheme,
            width: 1,
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      );

  static ElevatedButtonThemeData get darkTheme => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: foregroundColorDarkTheme,
          backgroundColor: backgroundColorDarkTheme,
          disabledBackgroundColor: Colors.grey,
          disabledForegroundColor: Colors.grey,
          side: const BorderSide(
            color: backgroundColorDarkTheme,
            width: 1,
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
}
