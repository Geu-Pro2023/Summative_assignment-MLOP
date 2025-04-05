import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const TextStyle headline1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyText1 = TextStyle(
    fontSize: 16,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyText2 = TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary,
  );

  static const TextStyle appBarTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle bottomNavSelected = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: AppColors.accent,
  );

  static const TextStyle bottomNavUnselected = TextStyle(
    fontSize: 12,
    color: AppColors.textSecondary,
  );
}
