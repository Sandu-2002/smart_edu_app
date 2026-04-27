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
                    child: _NoticeFormCard(),
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
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 14),

          AppTextField(
            label: 'Audience',
            hintText: 'Students / Parents / Teachers',
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 14),

          AppTextField(
            label: 'Notice Body',
            hintText: 'Write the full notice content here',
            maxLines: 6,
            keyboardType: TextInputType.multiline,
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
        Container(
          width: 5,
          height: 20,
          color: Colors.blue,
        ),
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