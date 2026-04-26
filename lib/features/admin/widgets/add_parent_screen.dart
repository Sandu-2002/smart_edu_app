import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';
import '../../core/routes/route_names.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/app_text_field.dart';
import '../../core/widgets/top_blue_header.dart';

class AddParentScreen extends StatelessWidget {
  const AddParentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 28),
              child: Column(
                children: [
                  TopBlueHeader(
                    height: 235,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          'Add Parent',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Create parent record and link student',
                          style: TextStyle(color: Colors.white70, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      children: [
                        const _ParentPhotoCard(),
                        const SizedBox(height: 18),
                        const _ParentFormCard(),
                        const SizedBox(height: 18),
                        Row(
                          children: [
                            Expanded(
                              child: AppButton(
                                text: 'Cancel',
                                backgroundColor: const Color(0xFFF0C7C7),
                                textColor: AppColors.textBlack,
                                onTap: () => context.go(RouteNames.adminShell),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: AppButton(
                                text: 'Save Parent',
                                onTap: () => context.go(RouteNames.adminShell),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ParentPhotoCard extends StatelessWidget {
  const _ParentPhotoCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: _box(),
      child: Column(
        children: [
          Container(
            width: 104,
            height: 104,
            decoration: BoxDecoration(
              color: const Color(0xFFD7DDF4),
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.borderBlue, width: 1.2),
            ),
            child: const Icon(
              Icons.add_a_photo_outlined,
              color: AppColors.primaryBlue,
              size: 34,
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'Upload Parent Photo',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.textBlack,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Tap here to add parent profile image',
            style: TextStyle(fontSize: 13, color: AppColors.mutedText),
          ),
        ],
      ),
    );
  }
}

class _ParentFormCard extends StatelessWidget {
  const _ParentFormCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: _box(),
      child: Column(
        children: [
          const _SectionLabel(title: 'Parent Information'),
          const SizedBox(height: 14),
          AppTextField(
            label: 'Parent ID',
            hintText: 'PAR-2026-0001',
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 14),
          AppTextField(
            label: 'Full Name',
            hintText: 'Enter parent full name',
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 14),
          AppTextField(
            label: 'NIC Number',
            hintText: 'Enter NIC number',
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 14),
          AppTextField(
            label: 'Phone Number',
            hintText: '+94 77 123 4567',
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 14),
          AppTextField(
            label: 'Email',
            hintText: 'parent@gmail.com',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 14),
          AppTextField(
            label: 'Address',
            hintText: 'Enter home address',
            maxLines: 3,
            keyboardType: TextInputType.multiline,
          ),
          const SizedBox(height: 18),
          const _SectionLabel(title: 'Student Link Information'),
          const SizedBox(height: 14),
          AppTextField(
            label: 'Student ID',
            hintText: 'STU-2026-0001',
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 14),
          AppTextField(
            label: 'Student Name',
            hintText: 'Enter student full name',
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 14),
          AppTextField(
            label: 'Relationship',
            hintText: 'Mother / Father / Guardian',
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 18),
          const _SectionLabel(title: 'Documents'),
          const SizedBox(height: 14),
          const _UploadBox(
            title: 'Upload NIC Copy',
            subtitle: 'PDF or image file',
            icon: Icons.badge_outlined,
            iconColor: AppColors.primaryBlue,
            iconBg: Color(0xFFD7DDF4),
          ),
          const SizedBox(height: 12),
          const _UploadBox(
            title: 'Upload Additional Document',
            subtitle: 'Optional attachment',
            icon: Icons.description_outlined,
            iconColor: AppColors.successGreen,
            iconBg: Color(0xFFCBE8C7),
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String title;

  const _SectionLabel({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 5,
          height: 20,
          decoration: BoxDecoration(
            color: AppColors.primaryBlue,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: AppColors.textBlack,
          ),
        ),
      ],
    );
  }
}

class _UploadBox extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final Color iconBg;

  const _UploadBox({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.iconBg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderSoft),
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textBlack,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.mutedText,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded, color: AppColors.primaryBlue),
        ],
      ),
    );
  }
}

BoxDecoration _box() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: AppColors.borderBlue, width: 1.2),
    boxShadow: const [
      BoxShadow(color: Color(0x12000000), blurRadius: 10, offset: Offset(0, 4)),
    ],
  );
}
