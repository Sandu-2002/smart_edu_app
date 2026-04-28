import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/utils/logout_helper.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/circular_avatar.dart';
import '../../core/widgets/top_blue_header.dart';

class ParentProfileScreen extends StatelessWidget {
  const ParentProfileScreen({super.key});

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
                      'Sewwandi Perera',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'PAR-2026-0001',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    const _ProfileInfoCard(
                      title: 'Full Name',
                      value: 'Sewwandi Perera',
                      icon: Icons.person_outline_rounded,
                    ),
                    const SizedBox(height: 14),
                    const _ProfileInfoCard(
                      title: 'Child Name',
                      value: 'Aruja Wirarathna',
                      icon: Icons.child_care_outlined,
                    ),
                    const SizedBox(height: 14),
                    const _ProfileInfoCard(
                      title: 'Student ID',
                      value: 'STU-2026-0001',
                      icon: Icons.badge_outlined,
                    ),
                    const SizedBox(height: 14),
                    const _ProfileInfoCard(
                      title: 'Class',
                      value: 'Grade 11-B',
                      icon: Icons.school_outlined,
                    ),
                    const SizedBox(height: 14),
                    const _ProfileInfoCard(
                      title: 'Email',
                      value: 'parent@smartedu.com',
                      icon: Icons.mail_outline_rounded,
                    ),
                    const SizedBox(height: 14),
                    const _ProfileInfoCard(
                      title: 'Phone Number',
                      value: '+94 77 123 4567',
                      icon: Icons.phone_outlined,
                    ),
                    const SizedBox(height: 18),
                    const _SettingsSection(),
                    const SizedBox(height: 20),
                    AppButton(
                      text: 'Logout',
                      backgroundColor: const Color(0xFFF0C7C7),
                      textColor: AppColors.textBlack,
                      onTap: () => LogoutHelper.logout(context),
                    ),
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

class _SettingsSection extends StatelessWidget {
  const _SettingsSection();

  @override
  Widget build(BuildContext context) {
    final items = [
      {'title': 'Edit Profile', 'icon': Icons.edit_outlined},
      {'title': 'Child Progress', 'icon': Icons.bar_chart_outlined},
      {'title': 'Messages', 'icon': Icons.chat_bubble_outline},
      {'title': 'Help & Support', 'icon': Icons.help_outline_rounded},
    ];

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
            'Account Settings',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: AppColors.textBlack,
            ),
          ),
          const SizedBox(height: 14),
          ...items.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;

            return Container(
              margin: EdgeInsets.only(
                bottom: index == items.length - 1 ? 0 : 12,
              ),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFF9F9F9),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.borderSoft),
              ),
              child: Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD7DDF4),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      item['icon']! as IconData,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      item['title']! as String,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textBlack,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right_rounded,
                    color: AppColors.primaryBlue,
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
