import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

class StatusChip extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? icon;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final double fontSize;
  final FontWeight fontWeight;

  const StatusChip({
    super.key,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.padding,
    this.borderRadius = 22,
    this.fontSize = 11,
    this.fontWeight = FontWeight.w700,
  });

  factory StatusChip.success({Key? key, required String text, IconData? icon}) {
    return StatusChip(
      key: key,
      text: text,
      icon: icon,
      backgroundColor: AppColors.successSoft,
      textColor: AppColors.textBlack,
    );
  }

  factory StatusChip.warning({Key? key, required String text, IconData? icon}) {
    return StatusChip(
      key: key,
      text: text,
      icon: icon,
      backgroundColor: AppColors.warningSoft,
      textColor: AppColors.textBlack,
    );
  }

  factory StatusChip.danger({Key? key, required String text, IconData? icon}) {
    return StatusChip(
      key: key,
      text: text,
      icon: icon,
      backgroundColor: AppColors.dangerSoft,
      textColor: AppColors.textBlack,
    );
  }

  factory StatusChip.primary({Key? key, required String text, IconData? icon}) {
    return StatusChip(
      key: key,
      text: text,
      icon: icon,
      backgroundColor: const Color(0xFFD7DDF4),
      textColor: AppColors.primaryBlue,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bg = backgroundColor ?? const Color(0xFFD7DDF4);
    final fg = textColor ?? AppColors.textBlack;

    return Container(
      padding:
          padding ??
          const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: fg),
            const SizedBox(width: 5),
          ],
          Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: fg,
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }
}
