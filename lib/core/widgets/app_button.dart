import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final Color textColor;
  final double height;
  final double borderRadius;
  final bool loading;
  final IconData? icon;
  final double fontSize;

  const AppButton({
    super.key,
    required this.text,
    required this.onTap,
    this.backgroundColor = AppColors.primaryBlue,
    this.textColor = Colors.white,
    this.height = 54,
    this.borderRadius = 14,
    this.loading = false,
    this.icon,
    this.fontSize = 15,
  });

  @override
  Widget build(BuildContext context) {
    final disabled = onTap == null || loading;

    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: disabled ? null : onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: disabled
              ? backgroundColor.withOpacity(0.65)
              : backgroundColor,
          foregroundColor: textColor,
          disabledBackgroundColor: backgroundColor.withOpacity(0.65),
          disabledForegroundColor: textColor.withOpacity(0.8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: loading
            ? SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2.4,
                  valueColor: AlwaysStoppedAnimation<Color>(textColor),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 20),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
