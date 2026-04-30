import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/top_blue_header.dart';

class StudentScheduleScreen extends StatelessWidget {
  const StudentScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final schedule = [
      {
        'subject': 'Mathematics',
        'teacher': 'Mrs. Dilki Perera',
        'time': '08.00 AM - 09.00 AM',
        'status': 'ENDED',
        'chipColor': const Color(0xFFF5DE9B),
      },
      {
        'subject': 'ICT Lab',
        'teacher': 'Mr. Nuwan Silva',
        'time': '10.00 AM - 11.30 AM',
        'status': 'NOW',
        'chipColor': const Color(0xFFCBE8C7),
      },
      {
        'subject': 'Science',
        'teacher': 'Mr. Rukshan Fernando',
        'time': '01.00 PM - 02.00 PM',
        'status': 'NEXT',
        'chipColor': const Color(0xFFD7DDF4),
      },
      {
        'subject': 'English',
        'teacher': 'Mrs. Anoma Jayasuriya',
        'time': '03.00 PM - 04.00 PM',
        'status': 'LAB',
        'chipColor': const Color(0xFFD7DDF4),
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
                      'Schedule',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Today • Monday',
                      style: TextStyle(color: Colors.white70, fontSize: 15),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    const _DateSelectorRow(),
                    const SizedBox(height: 18),
                    ...schedule.map(
                      (item) => _ScheduleTimelineTile(
                        subject: item['subject']! as String,
                        teacher: item['teacher']! as String,
                        time: item['time']! as String,
                        status: item['status']! as String,
                        chipColor: item['chipColor']! as Color,
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

class _DateSelectorRow extends StatelessWidget {
  const _DateSelectorRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        _DateChip(day: 'Mon', date: '12', selected: true),
        _DateChip(day: 'Tue', date: '13'),
        _DateChip(day: 'Wed', date: '14'),
        _DateChip(day: 'Thu', date: '15'),
        _DateChip(day: 'Fri', date: '16'),
      ],
    );
  }
}

class _DateChip extends StatelessWidget {
  final String day;
  final String date;
  final bool selected;

  const _DateChip({
    required this.day,
    required this.date,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: selected ? AppColors.primaryBlue : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderBlue, width: 1.2),
        boxShadow: selected
            ? const [
                BoxShadow(
                  color: Color(0x12000000),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Column(
        children: [
          Text(
            day,
            style: TextStyle(
              fontSize: 12,
              color: selected ? Colors.white70 : AppColors.mutedText,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            date,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: selected ? Colors.white : AppColors.textBlack,
            ),
          ),
        ],
      ),
    );
  }
}

class _ScheduleTimelineTile extends StatelessWidget {
  final String subject;
  final String teacher;
  final String time;
  final String status;
  final Color chipColor;

  const _ScheduleTimelineTile({
    required this.subject,
    required this.teacher,
    required this.time,
    required this.status,
    required this.chipColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                color: AppColors.primaryBlue,
                shape: BoxShape.circle,
              ),
            ),
            Container(width: 2, height: 126, color: const Color(0xFFD7DDF4)),
          ],
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 14),
            padding: const EdgeInsets.all(16),
            decoration: _box(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        subject,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textBlack,
                        ),
                      ),
                    ),
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
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  teacher,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.mutedText,
                  ),
                ),
                const SizedBox(height: 10),
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
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9F9F9),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: AppColors.borderSoft),
                  ),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.location_on_outlined,
                        size: 18,
                        color: AppColors.primaryBlue,
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          'Class Room / Lab details available here',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.mutedText,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
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