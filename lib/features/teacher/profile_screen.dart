import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/utils/logout_helper.dart';
import '../../core/widgets/app_button.dart';
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
              Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    const _ProfileInfoCard(
                      title: 'Full Name',
                      value: 'Mr. Nuwan Silva',
                      icon: Icons.person_outline_rounded,
                    ),
                    const SizedBox(height: 14),
                    const _ProfileInfoCard(
                      title: 'Teacher ID',
                      value: 'TEA-2026-0001',
                      icon: Icons.badge_outlined,
                    ),
                    const SizedBox(height: 14),
                    const _ProfileInfoCard(
                      title: 'Subject',
                      value: 'Information & Communication Technology',
                      icon: Icons.menu_book_outlined,
                    ),
                    const SizedBox(height: 14),
                    const _ProfileInfoCard(
                      title: 'Assigned Class',
                      value: 'Grade 11-B',
                      icon: Icons.school_outlined,
                    ),
                    const SizedBox(height: 14),
                    const _ProfileInfoCard(
                      title: 'Email',
                      value: 'teacher@smartedu.com',
                      icon: Icons.mail_outline_rounded,
                    ),
                    const SizedBox(height: 14),
                    const _ProfileInfoCard(
                      title: 'Phone Number',
                      value: '+94 77 987 6543',
                      icon: Icons.phone_outlined,
                    ),
                    const SizedBox(height: 18),
                    const _TeacherStatsSection(),
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