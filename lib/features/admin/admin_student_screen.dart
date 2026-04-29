import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';
import '../../core/routes/route_names.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/app_text_field.dart';
import '../../core/widgets/top_blue_header.dart';

class AdmitStudentScreen extends StatelessWidget {
  const AdmitStudentScreen({super.key});

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
                          'Admit Student',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Complete student admission details',
                          style: TextStyle(color: Colors.white70, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      children: [
                        const _PhotoUploadCard(),
                        const SizedBox(height: 18),
                        const _AdmissionFormCard(),
                        const SizedBox(height: 18),
                        Row(
                          children: [
                            Expanded(
                              child: AppButton(
                                text: 'Save as Draft',
                                backgroundColor: const Color(0xFFD7DDF4),
                                textColor: AppColors.primaryBlue,
                                onTap: () {},
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: AppButton(
                                text: 'Complete Admission',
                                onTap: () =>
                                    context.go(RouteNames.adminSuccess),
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

class _PhotoUploadCard extends StatelessWidget {
  const _PhotoUploadCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
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
        children: [
          Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              color: const Color(0xFFD7DDF4),
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.borderBlue, width: 1.2),
            ),
            child: const Icon(
              Icons.add_a_photo_outlined,
              color: AppColors.primaryBlue,
              size: 36,
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'Upload Student Photo',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.textBlack,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Tap here to add profile image',
            style: TextStyle(fontSize: 13, color: AppColors.mutedText),
          ),
        ],
      ),
    );
  }
}

class _AdmissionFormCard extends StatelessWidget {
  const _AdmissionFormCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
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
        children: [
          const _SectionLabel(title: 'Student Information'),
          const SizedBox(height: 14),
          AppTextField(
            label: 'Admission Number',
            hintText: 'STU-2026-0001',
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 14),
          AppTextField(
            label: 'Full Name',
            hintText: 'Enter student full name',
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 14),
          AppTextField(
            label: 'Date of Birth',
            hintText: 'DD / MM / YYYY',
            keyboardType: TextInputType.datetime,
          ),
          const SizedBox(height: 14),
          AppTextField(
            label: 'Class',
            hintText: 'Grade 11-B',
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 14),
          AppTextField(
            label: 'Address',
            hintText: 'Enter home address',
            maxLines: 3,
            keyboardType: TextInputType.multiline,
          ),
          const SizedBox(height: 18),
          const _SectionLabel(title: 'Parent / Guardian Information'),
          const SizedBox(height: 14),
          AppTextField(
            label: 'Parent Name',
            hintText: 'Enter parent or guardian name',
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 14),
          AppTextField(
            label: 'Parent Email',
            hintText: 'parent@gmail.com',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 14),
          AppTextField(
            label: 'Parent Phone Number',
            hintText: '+94 77 123 4567',
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 18),
          const _SectionLabel(title: 'Documents'),
          const SizedBox(height: 14),
          const _UploadBox(
            title: 'Upload Birth Certificate',
            subtitle: 'PDF or image file',
            icon: Icons.upload_file_outlined,
            iconColor: AppColors.successGreen,
            iconBg: Color(0xFFCBE8C7),
          ),
          const SizedBox(height: 12),
          const _UploadBox(
            title: 'Upload Previous School Record',
            subtitle: 'Optional document',
            icon: Icons.description_outlined,
            iconColor: AppColors.primaryBlue,
            iconBg: Color(0xFFD7DDF4),
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
