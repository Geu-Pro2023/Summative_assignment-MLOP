import 'package:flutter/material.dart';
import 'app_colors.dart';

TextStyle get headlineLarge => const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
    );

TextStyle get headlineMedium => const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    );

TextStyle get bodyLarge => const TextStyle(
      fontSize: 16,
      color: AppColors.textPrimary,
    );

TextStyle get bodyMedium => const TextStyle(
      fontSize: 14,
      color: AppColors.textSecondary,
    );

TextStyle get buttonText => const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );
