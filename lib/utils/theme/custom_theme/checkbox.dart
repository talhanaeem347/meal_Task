import 'package:meal_task/utils/constants/color.dart';
import 'package:flutter/material.dart';

class AppCheckboxTheme {
  AppCheckboxTheme._();

  static const activeColor = AppColors.primaryColor;

  static  CheckboxThemeData get lightTheme => CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    checkColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.white;
        }
        return Colors.black;
      },
    ),
    fillColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.selected)) {
          return activeColor;
        }
        return Colors.transparent;
      },
    ),
    side: const BorderSide(
      color: activeColor,
      width: 1,
    ),
    splashRadius: 4,
    visualDensity: VisualDensity.standard,
    materialTapTargetSize: MaterialTapTargetSize.padded,

  );


  static final CheckboxThemeData darkTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    checkColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.white;
        }
        return Colors.black;
      },
    ),
    fillColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.black;
        }
        return Colors.transparent;
      },
    ),
    side: const BorderSide(
      color: Colors.white,
      width: 1,
    ),
    splashRadius: 4,
    visualDensity: VisualDensity.standard,
    materialTapTargetSize: MaterialTapTargetSize.padded,
  );

}
