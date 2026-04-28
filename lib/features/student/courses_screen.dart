import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/search_box.dart';
import '../../core/widgets/top_blue_header.dart';

class StudentCoursesScreen extends StatelessWidget {
  const StudentCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final courses = [
      {
        'title': 'Database Management Systems',
        'teacher': 'Mr. Nuwan Silva',
        'time': '08.00 AM - 09.30 AM',
        'status': 'LIVE',
        'chipColor': const Color(0xFFCBE8C7),
        'icon': Icons.storage_rounded,
      },
      {
        'title': 'Mathematics',
        'teacher': 'Mrs. Dilki Perera',
        'time': '10.00 AM - 11.30 AM',
        'status': 'TODAY',
        'chipColor': const Color(0xFFF5DE9B),
        'icon': Icons.functions_rounded,
      },
      {
        'title': 'Science',
        'teacher': 'Mr. Rukshan Fernando',
        'time': '01.00 PM - 02.30 PM',
        'status': 'NEXT',
        'chipColor': const Color(0xFFD7DDF4),
        'icon': Icons.science_outlined,
      },
      {
        'title': 'English',
        'teacher': 'Mrs. Anoma Jayasuriya',
        'time': '03.00 PM - 04.00 PM',
        'status': 'OPEN',
        'chipColor': const Color(0xFFD7DDF4),
        'icon': Icons.menu_book_outlined,
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
                      'Courses',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Explore your daily subjects',
                      style: TextStyle(color: Colors.white70, fontSize: 15),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    const SearchBox(hintText: 'Search courses'),
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
                          text: 'Today',
                          color: Color(0xFFF5DE9B),
                          textColor: AppColors.textBlack,
                        ),
                        SizedBox(width: 8),
                        _FilterChip(
                          text: 'Live',
                          color: Color(0xFFCBE8C7),
                          textColor: AppColors.textBlack,
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    ...courses.map(
                      (course) => _CourseTile(
                        title: course['title']! as String,
                        teacher: course['teacher']! as String,
                        time: course['time']! as String,
                        status: course['status']! as String,
                        chipColor: course['chipColor']! as Color,
                        icon: course['icon']! as IconData,
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

class _CourseTile extends StatelessWidget {
  final String title;
  final String teacher;
  final String time;
  final String status;
  final Color chipColor;
  final IconData icon;

  const _CourseTile({
    required this.title,
    required this.teacher,
    required this.time,
    required this.status,
    required this.chipColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: _box(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 52,
            height: 52,
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
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textBlack,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  teacher,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.mutedText,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time_rounded,
                      size: 18,
                      color: AppColors.primaryBlue,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        time,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textBlack,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: chipColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textBlack,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.primaryBlue,
              ),
            ],
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