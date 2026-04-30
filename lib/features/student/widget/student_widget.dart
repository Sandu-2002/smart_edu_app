import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class StudentFloatingBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const StudentFloatingBar({
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
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined, color: AppColors.primaryBlue),
            selectedIcon: Icon(
              Icons.menu_book_rounded,
              color: AppColors.primaryBlue,
            ),
            label: 'Courses',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.calendar_month_outlined,
              color: AppColors.primaryBlue,
            ),
            selectedIcon: Icon(
              Icons.calendar_month_rounded,
              color: AppColors.primaryBlue,
            ),
            label: 'Schedule',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline, color: AppColors.primaryBlue),
            selectedIcon: Icon(Icons.person, color: AppColors.primaryBlue),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
