import 'package:final_ledy_taxi_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ThemeProvider {
  static final lightThemeData = ThemeData(
    colorScheme: ColorScheme.light(background: AppColors.whiteClr),
  );
  static final darkThemeData = ThemeData(
    colorScheme: ColorScheme.dark(background: AppColors.blcColor),
  );
}
