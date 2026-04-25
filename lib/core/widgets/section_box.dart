import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

class SearchBox extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTapFilter;
  final bool showFilter;
  final bool enabled;

  const SearchBox({
    super.key,
    this.hintText = 'Search...',
    this.controller,
    this.onChanged,
    this.onTapFilter,
    this.showFilter = true,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        border: Border.all(
          color: AppColors.borderBlue,
          width: AppSizes.borderWidth,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x10000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 14),
          const Icon(
            Icons.search_rounded,
            color: AppColors.primaryBlue,
            size: 22,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              enabled: enabled,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textBlack,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: AppColors.mutedText,
                  fontSize: 14,
                ),
                border: InputBorder.none,
                isCollapsed: true,
              ),
            ),
          ),
          if (showFilter) ...[
            Container(width: 1, height: 26, color: AppColors.borderSoft),
            InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: onTapFilter,
              child: Container(
                width: 52,
                height: double.infinity,
                alignment: Alignment.center,
                child: const Icon(
                  Icons.tune_rounded,
                  color: AppColors.primaryBlue,
                  size: 22,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
