import 'package:flutter/material.dart';

import 'courses_screen.dart';
import 'dashboard_screen.dart';
import 'profile_screen.dart';
import 'schedule_screen.dart';
import 'widgets/student_bottom_bar.dart';

class StudentShell extends StatefulWidget {
  const StudentShell({super.key});

  @override
  State<StudentShell> createState() => _StudentShellState();
}

class _StudentShellState extends State<StudentShell> {
  int currentIndex = 0;

  late final List<Widget> pages = const [
    StudentDashboardScreen(),
    StudentCoursesScreen(),
    StudentScheduleScreen(),
    StudentProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: StudentFloatingBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
