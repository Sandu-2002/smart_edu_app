import 'package:flutter/material.dart';

import 'chat_screen.dart';
import 'dashboard_screen.dart';
import 'profile_screen.dart';
import 'result_screen.dart';
import 'widgets/parent_bottom_bar.dart';

class ParentShell extends StatefulWidget {
  const ParentShell({super.key});

  @override
  State<ParentShell> createState() => _ParentShellState();
}

class _ParentShellState extends State<ParentShell> {
  int currentIndex = 0;

  late final List<Widget> pages = const [
    ParentDashboardScreen(),
    ParentResultScreen(),
    ParentChatScreen(),
    ParentProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: ParentFloatingBar(
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
