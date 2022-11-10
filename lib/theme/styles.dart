import 'package:flutter/widgets.dart';

class AppColors {
  static const Color primary = Color(0xFF8ab0ab);
  static const Color secondary = Color(0xFF3e505b);
  static const Color darkPrimary = Color(0xFF26413c);
  static const Color darkerPrimary = Color(0xFF1a1d1a);
  static const Color black = Color(0xFF03120e);
  static const Color white = Color(0xFFFFFFFF);
}

class AppTextStyle {
  static const TextStyle heading_1 = TextStyle(
      color: AppColors.black, fontSize: 32, fontWeight: FontWeight.w600);

  static const TextStyle heading_2 = TextStyle(
      color: AppColors.black, fontSize: 24, fontWeight: FontWeight.w500);

  static const TextStyle heading_3 = TextStyle(
      color: AppColors.black, fontSize: 20, fontWeight: FontWeight.w500);

  static const TextStyle text = TextStyle(
      color: AppColors.black, fontSize: 16, fontWeight: FontWeight.w400);

  static const TextStyle smallText = TextStyle(
      color: AppColors.black, fontSize: 12, fontWeight: FontWeight.w400);

  static const TextStyle headingWhite_1 = TextStyle(
      color: AppColors.white, fontSize: 32, fontWeight: FontWeight.w600);

  static const TextStyle headingWhite_2 = TextStyle(
      color: AppColors.white, fontSize: 24, fontWeight: FontWeight.w500);

  static const TextStyle headingWhite_3 = TextStyle(
      color: AppColors.white, fontSize: 20, fontWeight: FontWeight.w500);

  static const TextStyle textWhite_ = TextStyle(
      color: AppColors.white, fontSize: 16, fontWeight: FontWeight.w400);

  static const TextStyle smallWhiteText = TextStyle(
      color: AppColors.white, fontSize: 12, fontWeight: FontWeight.w400);
}

class AppStyleConstants {
  static const double cornerRadius = 20;
  static const double separation = 20;
}
