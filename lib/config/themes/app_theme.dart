import 'package:chat_group/core/utils/app_colors.dart';
import 'package:chat_group/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(

    primaryColor: AppColors.primaryColor,
    primarySwatch: Colors.green,
    hintColor: AppColors.greyColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: AppStrings.fontFamily,
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: AppColors.whiteColor.withOpacity(0.2),
        elevation: 0,
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16.0)),
    textTheme: const TextTheme(
      displayMedium: TextStyle(
          height: 1.3,
          fontSize: 22,
          color: Colors.white,
          fontWeight: FontWeight.bold),
    ),
  );
}
