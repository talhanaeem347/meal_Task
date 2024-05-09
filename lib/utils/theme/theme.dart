import 'package:meal_task/utils/exports.dart';
import 'package:meal_task/utils/theme/custom_theme/icon_button.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'inter',
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.scaffoldColor,
    appBarTheme: AppAppBarTheme.lightTheme,
    textTheme: AppTextTheme.lightTextTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightTheme,
    bottomSheetTheme: AppBottomSheet.lightTheme,
    checkboxTheme: AppCheckboxTheme.lightTheme,
    chipTheme: AppChipTheme.lightTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.lightTheme,
    inputDecorationTheme: AppTextFormFieldTheme.lightTheme,
    textButtonTheme: AppTextButtonTheme.lightTheme,
    iconButtonTheme: AppIconButtonTheme.lightTheme,
  );

  }
