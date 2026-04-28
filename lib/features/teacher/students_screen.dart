import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/search_box.dart';
import '../../core/widgets/top_blue_header.dart';

import 'widgets/student_tile.dart';
import 'widgets/filter_chip.dart';

class TeacherStudentsScreen extends StatelessWidget {
  const TeacherStudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final students = [
      {
        'name': 'Aruja Wirarathna',
        'id': 'STU-2026-0001',
        'class': 'Grade 11-B',
        'status': 'Active',
        'statusColor': const Color(0xFFCBE8C7),
      },
      {
        'name': 'Nethmi Perera',
        'id': 'STU-2026-0002',
        'class': 'Grade 11-B',
        'status': 'Active',
        'statusColor': const Color(0xFFCBE8C7),
      },
      {
        'name': 'Kavindu Silva',
        'id': 'STU-2026-0003',
        'class': 'Grade 11-B',
        'status': 'Pending',
        'statusColor': const Color(0xFFF5DE9B),
      },
      {
        'name': 'Sashini Fernando',
        'id': 'STU-2026-0004',
        'class': 'Grade 11-B',
        'status': 'Active',
        'statusColor': const Color(0xFFCBE8C7),
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryBlue,
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
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
                      'Students',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Manage student directory',
                      style: TextStyle(color: Colors.white70, fontSize: 15),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    const SearchBox(hintText: 'Search students'),
                    const SizedBox(height: 16),

                    Row(
                      children: const [
                        FilterChipWidget(
                          text: 'All',
                          color: Color(0xFFD7DDF4),
                          textColor: AppColors.primaryBlue,
                        ),
                        SizedBox(width: 8),
                        FilterChipWidget(
                          text: 'Active',
                          color: Color(0xFFCBE8C7),
                          textColor: AppColors.textBlack,
                        ),
                        SizedBox(width: 8),
                        FilterChipWidget(
                          text: 'Pending',
                          color: Color(0xFFF5DE9B),
                          textColor: AppColors.textBlack,
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    ...students.map(
                      (student) => StudentTile(
                        name: student['name']! as String,
                        id: student['id']! as String,
                        className: student['class']! as String,
                        status: student['status']! as String,
                        statusColor: student['statusColor']! as Color,
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