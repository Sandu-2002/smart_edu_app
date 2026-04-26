import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTextStyles {
  static const heroWhite = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    height: 1.1,
  );

  static const heroSubWhite = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: Colors.white70,
    height: 1.3,
  );

  static const pageTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.textBlack,
  );

  static const cardTitle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    color: AppColors.textBlack,
  );

  static const body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textBlack,
  );

  static const muted = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.mutedText,
  );

  static const buttonWhite = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
}
