import 'package:flutter/material.dart';
import 'package:mobile_project/theme/app_colors.dart';

extension AppTextTheme on TextTheme {
  TextStyle get titleText => const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColors.titleText,
      fontFamily: 'Inter');
  TextStyle get placeholdere => const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.inactiveTextGrey,
      fontFamily: 'Inter');
  TextStyle get actionButtonStyle => const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColors.primaryPurple,
      fontFamily: 'Inter');
  TextStyle get textPWStyle => const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryPurple,
      fontFamily: 'Poppins');
  TextStyle get snackTitleStyle => const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: AppColors.neutralGray,
      fontFamily: 'Inter');
  TextStyle get lableBtmBarStyle => const TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColors.titleBottombar,
      fontFamily: 'Inter');
  TextStyle get errorTextStyle => const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.errorRed,
      fontFamily: 'Inter');
  TextStyle get searchTitle => const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.titleSearch,
      fontFamily: 'Roboto');
  TextStyle get filterButton => const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryPurple,
      fontFamily: 'Roboto');
}
