import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/widgets/top_blue_header.dart';
import '../../core/widgets/app_text_field.dart';

class PostNoticeScreen extends StatelessWidget {
  const PostNoticeScreen({super.key});

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
                          'Post Notice',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Publish updates for students, parents and teachers',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.all(18),
                    child: Column(
                      children: [
                        _NoticeFormCard(),
                        SizedBox(height: 18),

                        _NoticePreviewCard(),
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

class _NoticeFormCard extends StatelessWidget {
  const _NoticeFormCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: const [
          _SectionTitle(title: 'Notice Information'),
          SizedBox(height: 14),

          AppTextField(
            label: 'Subject',
            hintText: 'Enter notice title',
          ),
          SizedBox(height: 14),

          AppTextField(
            label: 'Audience',
            hintText: 'Students / Parents / Teachers',
          ),
          SizedBox(height: 14),

          AppTextField(
            label: 'Notice Body',
            hintText: 'Write the full notice content here',
            maxLines: 6,
          ),
          SizedBox(height: 14),

          _UploadTile(
            title: 'Attach File',
            subtitle: 'Optional PDF or image attachment',
            icon: Icons.attach_file_rounded,
            iconBg: Color(0xFFD7DDF4),
            iconColor: AppColors.primaryBlue,
          ),
          SizedBox(height: 14),

          _UrgentSwitch(),
        ],
      ),
    );
  }
}


class _NoticePreviewCard extends StatelessWidget {
  const _NoticePreviewCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionTitle(title: 'Notice Preview'),
          const SizedBox(height: 14),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF9F9F9),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5DE9B),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'URGENT',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'Today',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 14),

                const Text(
                  'Portal Maintenance Notice',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),

                const Text(
                  'Audience: Students / Parents / Teachers',
                  style: TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 12),

                const Text(
                  'Portal maintenance schedules for Sunday, 02.00 A.M - 08.00 A.M.',
                  style: TextStyle(height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 5, height: 20, color: Colors.blue),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _UploadTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconBg;
  final Color iconColor;

  const _UploadTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconBg,
    required this.iconColor,
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
          Icon(icon, color: iconColor),
          const SizedBox(width: 12),
          Expanded(child: Text(title)),
          const Icon(Icons.chevron_right_rounded),
        ],
      ),
    );
  }
}

class _UrgentSwitch extends StatelessWidget {
  const _UrgentSwitch();

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: true,
      onChanged: (_) {},
      activeColor: AppColors.primaryBlue,
      title: const Text('Mark as urgent'),
      subtitle: const Text('This notice will be highlighted'),
    );
  }
}