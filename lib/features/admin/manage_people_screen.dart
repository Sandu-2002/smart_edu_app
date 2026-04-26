import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';
import '../../core/routes/route_names.dart';
import '../../core/widgets/top_blue_header.dart';

class ManagePeopleScreen extends StatelessWidget {
  const ManagePeopleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 28),
              child: Column(
                children: [
                  TopBlueHeader(
                    height: 235,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          'Manage People',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Add and manage students, parents and teachers',
                          style: TextStyle(color: Colors.white70, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      children: [
                        const _SectionCard(
                          title: 'Quick Actions',
                          child: _QuickActionList(),
                        ),
                        const SizedBox(height: 18),
                        const _SectionCard(
                          title: 'Recently Added',
                          child: Column(
                            children: [
                              _PersonTile(
                                name: 'Aruja Wirarathna',
                                idText: 'STU-2026-0001',
                                role: 'Student',
                                roleColor: Color(0xFFCBE8C7),
                              ),
                              SizedBox(height: 12),
                              _PersonTile(
                                name: 'Sewwandi Perera',
                                idText: 'PAR-2026-0001',
                                role: 'Parent',
                                roleColor: Color(0xFFD7DDF4),
                              ),
                              SizedBox(height: 12),
                              _PersonTile(
                                name: 'Nuwan Silva',
                                idText: 'TEA-2026-0001',
                                role: 'Teacher',
                                roleColor: Color(0xFFF5DE9B),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 18),
                        const _SectionCard(
                          title: 'People Summary',
                          child: Row(
                            children: [
                              Expanded(
                                child: _MiniSummaryCard(
                                  title: 'Students',
                                  value: '1,248',
                                  icon: Icons.groups_outlined,
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: _MiniSummaryCard(
                                  title: 'Parents',
                                  value: '1,102',
                                  icon: Icons.family_restroom_outlined,
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: _MiniSummaryCard(
                                  title: 'Teachers',
                                  value: '86',
                                  icon: Icons.school_outlined,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 18),
                        const _SectionCard(
                          title: 'Admin Notes',
                          child: Column(
                            children: [
                              _NoteTile(
                                title: 'Verify parent email addresses',
                                subtitle: '5 records need updates',
                              ),
                              SizedBox(height: 12),
                              _NoteTile(
                                title: 'Review teacher assignments',
                                subtitle: '2 new subject allocations pending',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _SectionCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: _box(),
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
          child,
        ],
      ),
    );
  }
}

class _QuickActionList extends StatelessWidget {
  const _QuickActionList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ActionTile(
          title: 'Admit Student',
          subtitle: 'Create a new student profile',
          icon: Icons.person_add_alt_1_outlined,
          onTap: () => context.go(RouteNames.adminAdmitStudent),
        ),
        const SizedBox(height: 12),
        _ActionTile(
          title: 'Add Parent',
          subtitle: 'Create a new parent profile',
          icon: Icons.family_restroom_outlined,
          onTap: () => context.go(RouteNames.adminAddParent),
        ),
        const SizedBox(height: 12),
        _ActionTile(
          title: 'Add Teacher',
          subtitle: 'Create a new teacher profile',
          icon: Icons.school_outlined,
          onTap: () {},
        ),
        const SizedBox(height: 12),
        _ActionTile(
          title: 'View Records',
          subtitle: 'Open all people records',
          icon: Icons.badge_outlined,
          onTap: () {},
        ),
      ],
    );
  }
}

class _ActionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const _ActionTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: _innerBox(),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: const Color(0xFFD7DDF4),
                borderRadius: BorderRadius.circular(12),
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
                      color: AppColors.textBlack,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.mutedText,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.primaryBlue,
            ),
          ],
        ),
      ),
    );
  }
}

class _PersonTile extends StatelessWidget {
  final String name;
  final String idText;
  final String role;
  final Color roleColor;

  const _PersonTile({
    required this.name,
    required this.idText,
    required this.role,
    required this.roleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: _innerBox(),
      child: Row(
        children: [
          const CircleAvatar(radius: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textBlack,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  idText,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.mutedText,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: roleColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              role,
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

class _MiniSummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _MiniSummaryCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      decoration: _innerBox(),
      child: Column(
        children: [
          Icon(icon, color: AppColors.primaryBlue, size: 24),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.textBlack,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: AppColors.mutedText),
          ),
        ],
      ),
    );
  }
}

class _NoteTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const _NoteTile({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: _innerBox(),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFF5DE9B),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.sticky_note_2_outlined,
              color: AppColors.textBlack,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textBlack,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.mutedText,
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

BoxDecoration _innerBox() {
  return BoxDecoration(
    color: const Color(0xFFF9F9F9),
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: AppColors.borderSoft),
  );
}
