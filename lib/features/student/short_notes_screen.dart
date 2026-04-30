import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/search_box.dart';
import '../../core/widgets/top_blue_header.dart';

class StudentShortNotesScreen extends StatelessWidget {
  const StudentShortNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notes = [
      {
        'subject': 'Database Management Systems',
        'subtitle': 'Unit 01 • Introduction to DBMS',
        'icon': Icons.storage_rounded,
        'color': const Color(0xFFD7DDF4),
      },
      {
        'subject': 'Mathematics',
        'subtitle': 'Unit 02 • Algebra Basics',
        'icon': Icons.functions_rounded,
        'color': const Color(0xFFF5DE9B),
      },
      {
        'subject': 'Science',
        'subtitle': 'Unit 03 • Force and Motion',
        'icon': Icons.science_outlined,
        'color': const Color(0xFFCBE8C7),
      },
      {
        'subject': 'English',
        'subtitle': 'Unit 04 • Essay Writing',
        'icon': Icons.menu_book_outlined,
        'color': const Color(0xFFD7DDF4),
      },
      {
        'subject': 'ICT',
        'subtitle': 'Unit 05 • Flowcharts and Logic',
        'icon': Icons.computer_outlined,
        'color': const Color(0xFFCBE8C7),
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 28),
          child: Column(
            children: [
              TopBlueHeader(
                height: 230,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      'Short Notes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Quick subject material',
                      style: TextStyle(color: Colors.white70, fontSize: 15),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    const SearchBox(hintText: 'Search notes'),
                    const SizedBox(height: 16),
                    Row(
                      children: const [
                        _FilterChip(
                          text: 'All',
                          color: Color(0xFFD7DDF4),
                          textColor: AppColors.primaryBlue,
                        ),
                        SizedBox(width: 8),
                        _FilterChip(
                          text: 'Recent',
                          color: Color(0xFFF5DE9B),
                          textColor: AppColors.textBlack,
                        ),
                        SizedBox(width: 8),
                        _FilterChip(
                          text: 'Saved',
                          color: Color(0xFFCBE8C7),
                          textColor: AppColors.textBlack,
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    ...notes.map(
                      (note) => _NoteTile(
                        subject: note['subject']! as String,
                        subtitle: note['subtitle']! as String,
                        icon: note['icon']! as IconData,
                        iconBg: note['color']! as Color,
                      ),
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

class _NoteTile extends StatelessWidget {
  final String subject;
  final String subtitle;
  final IconData icon;
  final Color iconBg;

  const _NoteTile({
    required this.subject,
    required this.subtitle,
    required this.icon,
    required this.iconBg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: _box(),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: iconBg,
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
                  subject,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textBlack,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.mutedText,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: const Color(0xFFF9F9F9),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.borderSoft),
            ),
            child: const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.primaryBlue,
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;

  const _FilterChip({
    required this.text,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
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
