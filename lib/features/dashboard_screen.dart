import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/top_blue_header.dart';
import '../../core/widgets/circular_avatar.dart';
import '../../core/routes/route_names.dart';

class ParentDashboardScreen extends StatelessWidget {
  const ParentDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBlueHeader(
              height: 240,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Row(
                    children: [
                      CircularAvatar(radius: 28),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello, Sewwandi',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Parent Portal',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.notifications_none_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: const [
                  _StudentHeroCard(),
                  SizedBox(height: 18),
                  _ParentQuickActions(),
                  SizedBox(height: 18),
                  _PerformanceCard(),

                  SizedBox(height: 18),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StudentHeroCard extends StatelessWidget {
  const _StudentHeroCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderBlue, width: 1.2),
      ),
      child: Row(
        children: [
          const CircularAvatar(radius: 34),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Aruja Wirarathna'),
                Text('Grade 11-B'),
                Text('STU-2026-0001'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ParentQuickActions extends StatelessWidget {
  const _ParentQuickActions();

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'title': 'Results',
        'icon': Icons.bar_chart_outlined,
        'route': RouteNames.parentShell,
      },
      {
        'title': 'Chat',
        'icon': Icons.chat_bubble_outline,
        'route': RouteNames.parentShell,
      },
      {
        'title': 'Profile',
        'icon': Icons.person_outline,
        'route': RouteNames.parentShell,
      },
    ];

    return Row(
      children: items.map((item) {
        return Expanded(
          child: GestureDetector(
            onTap: () => context.go(item['route']! as String),
            child: Column(
              children: [
                Icon(item['icon']! as IconData),
                Text(item['title']! as String),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _PerformanceCard extends StatelessWidget {
  const _PerformanceCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderBlue, width: 1.2),
      ),
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

          Row(
            children: const [
              Expanded(
                child: _SmallStat(
                  title: 'Average',
                  value: '88%',
                  icon: Icons.show_chart_rounded,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _SmallStat(
                  title: 'Rank',
                  value: '06',
                  icon: Icons.emoji_events_outlined,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SmallStat extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _SmallStat({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              Text(value),
            ],
          ),
        ],
      ),
    );
  }
}