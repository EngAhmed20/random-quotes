import 'package:flutter/material.dart';
import 'package:quotes_clean/core/utils/app_color.dart';
import 'package:quotes_clean/core/utils/app_string.dart';

ThemeData themeData(){
  return ThemeData(
    primaryColor: AppColors.primary,
    hintColor: AppColors.hint,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: AppStrings.fontFamily,
    appBarTheme:const  AppBarTheme(
      centerTitle: true,
      elevation: 0,
      color: Colors.transparent,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.black
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold,
        height: 1.3,

      ),
    ),

  );
}