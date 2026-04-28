import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class ParentFloatingBar extends StatelessWidget {
  const ParentFloatingBar({super.key});

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
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFD7DDF4),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,

        destinations: const [
          NavigationDestination(
            icon: Icon(
              Icons.dashboard_outlined,
              color: AppColors.primaryBlue,
            ),
            selectedIcon: Icon(
              Icons.dashboard_rounded,
              color: AppColors.primaryBlue,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.auto_graph_outlined,
              color: AppColors.primaryBlue,
            ),
            selectedIcon: Icon(
              Icons.auto_graph_rounded,
              color: AppColors.primaryBlue,
            ),
            label: 'Results',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.chat_bubble_outline,
              color: AppColors.primaryBlue,
            ),
            selectedIcon: Icon(
              Icons.chat_bubble,
              color: AppColors.primaryBlue,
            ),
            label: 'Chat',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person_outline,
              color: AppColors.primaryBlue,
            ),
            selectedIcon: Icon(
              Icons.person,
              color: AppColors.primaryBlue,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}