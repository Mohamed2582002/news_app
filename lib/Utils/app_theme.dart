

import 'package:flutter/material.dart';
import 'package:news/Utils/app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.whiteColor ,
    indicatorColor: AppColors.blackColor,
    iconTheme: IconThemeData(color: AppColors.blackColor),
    scaffoldBackgroundColor: AppColors.whiteColor,
    textTheme: TextTheme(labelLarge: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: AppColors.blackColor),
    labelMedium: TextStyle(fontWeight: FontWeight.normal,fontSize: 14,color: AppColors.blackColor),
      headlineLarge:  TextStyle(fontWeight: FontWeight.normal,fontSize: 20,color: AppColors.blackColor),
      headlineMedium:  TextStyle(fontWeight: FontWeight.normal,fontSize: 24,color: AppColors.blackColor),
    ),
    appBarTheme:  AppBarTheme(centerTitle: true,backgroundColor: AppColors.whiteColor) ,
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.blackColor ,
    indicatorColor: AppColors.whiteColor,
    iconTheme: IconThemeData(color: AppColors.whiteColor),
    scaffoldBackgroundColor: AppColors.blackColor,
    textTheme: TextTheme(labelLarge: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: AppColors.whiteColor),
      labelMedium: TextStyle(fontWeight: FontWeight.normal,fontSize: 14,color: AppColors.whiteColor),
      headlineLarge:  TextStyle(fontWeight: FontWeight.normal,fontSize: 20,color: AppColors.whiteColor),
      headlineMedium:  TextStyle(fontWeight: FontWeight.normal,fontSize: 24,color: AppColors.whiteColor),
    ),
    appBarTheme:  AppBarTheme(centerTitle: true,backgroundColor: AppColors.blackColor) ,
  );
}