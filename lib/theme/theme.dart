import 'package:flutter/material.dart';
import 'package:pillendar_app/theme/styles.dart';

class AppTheme {
  ThemeData getTheme() {
    return ThemeData(
      primaryColor: AppColors.primary,
      primaryColorDark: AppColors.darkPrimary,
      scaffoldBackgroundColor: AppColors.darkPrimary,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.darkPrimary,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(AppStyleConstants.cornerRadius)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.darkPrimary,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: EdgeInsets.zero,
          minimumSize: const Size(50, 30),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.darkPrimary),
        ),
        prefixIconColor: AppColors.darkerPrimary,
        suffixIconColor: AppColors.darkerPrimary,
      ),
    );
  }
}
