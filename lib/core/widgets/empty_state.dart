import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../widgets/app_button.dart';

class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;
  final String? buttonText;
  final VoidCallback? onTap;
  final double iconSize;
  final EdgeInsetsGeometry padding;

  const EmptyState({
    super.key,
    this.icon = Icons.inbox_outlined,
    required this.title,
    required this.message,
    this.buttonText,
    this.onTap,
    this.iconSize = 68,
    this.padding = const EdgeInsets.all(24),
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 110,
              height: 110,
              decoration: const BoxDecoration(
                color: Color(0xFFD7DDF4),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: iconSize, color: AppColors.primaryBlue),
            ),
            const SizedBox(height: 22),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.textBlack,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
                height: 1.5,
              ),
            ),
            if (buttonText != null && onTap != null) ...[
              const SizedBox(height: 22),
              SizedBox(
                width: 220,
                child: AppButton(text: buttonText!, onTap: onTap),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
