import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/top_blue_header.dart';

class ParentResultScreen extends StatelessWidget {
  const ParentResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final results = [
      {
        'subject': 'Mathematics',
        'marks': '92',
        'grade': 'A+',
        'color': const Color(0xFFCBE8C7),
      },
      {
        'subject': 'Science',
        'marks': '88',
        'grade': 'A',
        'color': const Color(0xFFD7DDF4),
      },
      {
        'subject': 'English',
        'marks': '79',
        'grade': 'B+',
        'color': const Color(0xFFF5DE9B),
      },
      {
        'subject': 'ICT',
        'marks': '95',
        'grade': 'A+',
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
                      'Exam Results',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Term 01 • 2026',
                      style: TextStyle(color: Colors.white70, fontSize: 15),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Expanded(
                          child: _SummaryCard(
                            title: 'Average',
                            value: '88%',
                            icon: Icons.auto_graph_outlined,
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: _SummaryCard(
                            title: 'Rank',
                            value: '06',
                            icon: Icons.emoji_events_outlined,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    const _PerformanceChartCard(),
                    const SizedBox(height: 18),
                    ...results.map(
                      (item) => _ResultTile(
                        subject: item['subject']! as String,
                        marks: item['marks']! as String,
                        grade: item['grade']! as String,
                        color: item['color']! as Color,
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

class _SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _SummaryCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _box(),
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

class _PerformanceChartCard extends StatelessWidget {
  const _PerformanceChartCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: _box(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Performance Overview',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: AppColors.textBlack,
            ),
          ),
          const SizedBox(height: 14),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
            decoration: BoxDecoration(
              color: const Color(0xFFF9F9F9),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.borderSoft),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _BarItem(
                  label: 'Math',
                  height: 88,
                  color: const Color(0xFFCBE8C7),
                ),
                _BarItem(
                  label: 'Sci',
                  height: 74,
                  color: const Color(0xFFD7DDF4),
                ),
                _BarItem(
                  label: 'Eng',
                  height: 58,
                  color: const Color(0xFFF5DE9B),
                ),
                _BarItem(
                  label: 'ICT',
                  height: 94,
                  color: const Color(0xFFCBE8C7),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BarItem extends StatelessWidget {
  final String label;
  final double height;
  final Color color;

  const _BarItem({
    required this.label,
    required this.height,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 28,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: AppColors.textBlack),
        ),
      ],
    );
  }
}

class _ResultTile extends StatelessWidget {
  final String subject;
  final String marks;
  final String grade;
  final Color color;

  const _ResultTile({
    required this.subject,
    required this.marks,
    required this.grade,
    required this.color,
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
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: const Color(0xFFD7DDF4),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.description_outlined,
              color: AppColors.primaryBlue,
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
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textBlack,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Marks: $marks',
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.mutedText,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              grade,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: AppColors.textBlack,
              ),
            ),
          ),
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
