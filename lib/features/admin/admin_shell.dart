import 'package:flutter/material.dart';

import 'dashboard_screen.dart';
import 'manage_people_screen.dart';
import 'post_notice_screen.dart';
import 'print_id_card_screen.dart';
import 'widgets/admin_bottom_bar.dart';

class AdminShell extends StatefulWidget {
  const AdminShell({super.key});

  @override
  State<AdminShell> createState() => _AdminShellState();
}

class _AdminShellState extends State<AdminShell> {
  int currentIndex = 0;

  late final List<Widget> pages = const [
    AdminDashboardScreen(),
    ManagePeopleScreen(),
    PostNoticeScreen(),
    PrintIdCardScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: AdminBottomBar(
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
