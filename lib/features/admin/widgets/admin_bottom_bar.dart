import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class AdminBottomBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AdminBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 12,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: NavigationBar(
        height: 74,
        selectedIndex: currentIndex,
        onDestinationSelected: onTap,
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFD7DDF4),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined, color: AppColors.primaryBlue),
            selectedIcon: Icon(
              Icons.dashboard_rounded,
              color: AppColors.primaryBlue,
            ),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.groups_outlined, color: AppColors.primaryBlue),
            selectedIcon: Icon(
              Icons.groups_rounded,
              color: AppColors.primaryBlue,
            ),
            label: 'People',
          ),
          NavigationDestination(
            icon: Icon(Icons.campaign_outlined, color: AppColors.primaryBlue),
            selectedIcon: Icon(
              Icons.campaign_rounded,
              color: AppColors.primaryBlue,
            ),
            label: 'Notice',
          ),
          NavigationDestination(
            icon: Icon(Icons.badge_outlined, color: AppColors.primaryBlue),
            selectedIcon: Icon(
              Icons.badge_rounded,
              color: AppColors.primaryBlue,
            ),
            label: 'Print ID',
          ),
        ],
      ),
    );
  }
}
