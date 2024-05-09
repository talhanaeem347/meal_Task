import 'package:flutter/material.dart';
import 'package:meal_task/utils/constants/color.dart';

class AppIconButtonTheme {
  AppIconButtonTheme._();

  static IconButtonThemeData lightTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.textBlack,
      visualDensity: const VisualDensity(horizontal: -4, vertical: 0),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      shape: const CircleBorder(),
    ),
  );

  static final OutlinedButtonThemeData darkTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      side: const BorderSide(
        color: Colors.white,
        width: 1,
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
    ),
  );

}
