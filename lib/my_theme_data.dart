import 'package:flutter/material.dart';
import 'package:new_app/app_colors.dart';

class MyThemeData {
  static final ThemeData lightMode = ThemeData(
    primaryColor: AppColors.primaryLightColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryLightColor,
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.primaryLightColor,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor,
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor,
      ),
    ),
  );
}
