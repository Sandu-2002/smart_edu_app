import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/circular_avatar.dart';
import '../../core/widgets/top_blue_header.dart';

class TeacherProfileScreen extends StatelessWidget {
  const TeacherProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 28),
          child: Column(
            children: [
              TopBlueHeader(
                height: 285,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    CircularAvatar(radius: 48),
                    SizedBox(height: 14),
                    Text(
                      'Mr. Nuwan Silva',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'TEA-2026-0001 • ICT Teacher',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),

              // Profile + Stats Section
              Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: const [
                    _ProfileInfoCard(
                      title: 'Full Name',
                      value: 'Mr. Nuwan Silva',
                      icon: Icons.person_outline_rounded,
                    ),
                    SizedBox(height: 14),
                    _ProfileInfoCard(
                      title: 'Teacher ID',
                      value: 'TEA-2026-0001',
                      icon: Icons.badge_outlined,
                    ),
                    SizedBox(height: 14),
                    _ProfileInfoCard(
                      title: 'Subject',
                      value: 'Information & Communication Technology',
                      icon: Icons.menu_book_outlined,
                    ),
                    SizedBox(height: 14),
                    _ProfileInfoCard(
                      title: 'Assigned Class',
                      value: 'Grade 11-B',
                      icon: Icons.school_outlined,
                    ),
                    SizedBox(height: 14),
                    _ProfileInfoCard(
                      title: 'Email',
                      value: 'teacher@smartedu.com',
                      icon: Icons.mail_outline_rounded,
                    ),
                    SizedBox(height: 14),
                    _ProfileInfoCard(
                      title: 'Phone Number',
                      value: '+94 77 987 6543',
                      icon: Icons.phone_outlined,
                    ),

                    SizedBox(height: 18),

                    //Teacher Stats Section Added
                    _TeacherStatsSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileInfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _ProfileInfoCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderBlue, width: 1.2),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: const Color(0xFFD7DDF4),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: AppColors.primaryBlue),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.mutedText,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textBlack,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TeacherStatsSection extends StatelessWidget {
  const _TeacherStatsSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderBlue, width: 1.2),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Teaching Summary',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: AppColors.textBlack,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: const [
              Expanded(
                child: _MiniStatCard(
                  title: 'Classes',
                  value: '04',
                  icon: Icons.class_outlined,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _MiniStatCard(
                  title: 'Students',
                  value: '128',
                  icon: Icons.groups_outlined,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: const [
              Expanded(
                child: _MiniStatCard(
                  title: 'Attendance',
                  value: '96%',
                  icon: Icons.fact_check_outlined,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _MiniStatCard(
                  title: 'Avg Marks',
                  value: '82%',
                  icon: Icons.auto_graph_outlined,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MiniStatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _MiniStatCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderSoft),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFD7DDF4),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.primaryBlue, size: 20),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.mutedText,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textBlack,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}