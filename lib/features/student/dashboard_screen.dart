import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';
import '../../core/routes/route_names.dart';
import '../../core/widgets/top_blue_header.dart';

class StudentDashboardScreen extends StatelessWidget {
  const StudentDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBlueHeader(
              height: 225,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    'Hello, Aruja',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Grade 11 • Class B',
                    style: TextStyle(color: Colors.white70, fontSize: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: const [
                  Row(
                    children: [
                      Expanded(
                        child: _MiniStatCard(
                          title: 'Attendance',
                          value: '98%',
                          icon: Icons.fact_check_outlined,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _MiniStatCard(
                          title: 'GPA',
                          value: '3.8',
                          icon: Icons.auto_graph_outlined,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 18),
                  _QuickActionGrid(),
                  SizedBox(height: 18),
                  _SectionCard(
                    title: 'Today Schedule',
                    items: [
                      _ScheduleItem(
                        subject: 'Mathematics',
                        time: '08.00 AM - 09.00 AM',
                        status: 'ENDED',
                      ),
                      _ScheduleItem(
                        subject: 'ICT Lab',
                        time: '10.00 AM - 11.30 AM',
                        status: 'NOW',
                      ),
                      _ScheduleItem(
                        subject: 'Science',
                        time: '01.00 PM - 02.00 PM',
                        status: 'NEXT',
                      ),
                    ],
                  ),
                  SizedBox(height: 18),
                  _SectionCard(
                    title: 'Recent Materials',
                    items: [
                      _MaterialItem(
                        title: 'DBMS Short Note',
                        subtitle: 'Uploaded today',
                        icon: Icons.description_outlined,
                      ),
                      _MaterialItem(
                        title: 'Algebra Guide Book',
                        subtitle: 'Uploaded yesterday',
                        icon: Icons.book_outlined,
                      ),
                      _MaterialItem(
                        title: 'Flowchart Lesson',
                        subtitle: 'New video lesson',
                        icon: Icons.play_circle_outline,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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
          const SizedBox(width: 12),
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
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 22,
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

class _QuickActionGrid extends StatelessWidget {
  const _QuickActionGrid();

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'title': 'Short Notes',
        'icon': Icons.description_outlined,
        'route': RouteNames.studentNotes,
      },
      {
        'title': 'Guide Books',
        'icon': Icons.book_outlined,
        'route': RouteNames.studentBooks,
      },
      {
        'title': 'Courses',
        'icon': Icons.menu_book_outlined,
        'route': RouteNames.studentShell,
      },
      {
        'title': 'Schedule',
        'icon': Icons.calendar_month_outlined,
        'route': RouteNames.studentShell,
      },
    ];

    return GridView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.35,
      ),
      itemBuilder: (context, index) {
        final item = items[index];

        return GestureDetector(
          onTap: () => context.go(item['route']! as String),
          child: Container(
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD7DDF4),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    item['icon']! as IconData,
                    color: AppColors.primaryBlue,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  item['title']! as String,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textBlack,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final List<Widget> items;

  const _SectionCard({required this.title, required this.items});

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
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: AppColors.textBlack,
            ),
          ),
          const SizedBox(height: 14),
          ...items,
        ],
      ),
    );
  }
}

class _ScheduleItem extends StatelessWidget {
  final String subject;
  final String time;
  final String status;

  const _ScheduleItem({
    required this.subject,
    required this.time,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color chipColor;
    if (status == 'NOW') {
      chipColor = const Color(0xFFCBE8C7);
    } else if (status == 'ENDED') {
      chipColor = const Color(0xFFF5DE9B);
    } else {
      chipColor = const Color(0xFFD7DDF4);
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderSoft),
      ),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: const BoxDecoration(
              color: AppColors.primaryBlue,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: const TextStyle(
                    color: AppColors.mutedText,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          _StatusChip(text: status, color: chipColor),
        ],
      ),
    );
  }
}

class _MaterialItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const _MaterialItem({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
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
              color: const Color(0xFFD7DDF4),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: AppColors.primaryBlue),
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
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: AppColors.mutedText,
                    fontSize: 13,
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

class _StatusChip extends StatelessWidget {
  final String text;
  final Color color;

  const _StatusChip({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 12,
          color: AppColors.textBlack,
        ),
      ),
    );
  }
}
