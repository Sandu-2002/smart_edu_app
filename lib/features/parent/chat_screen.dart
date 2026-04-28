import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/search_box.dart';

class ParentChatScreen extends StatelessWidget {
  const ParentChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chats = [
      {
        'name': 'Mr. Nuwan Silva',
        'message': 'Homework uploaded',
      },
      {
        'name': 'Mrs. Dilki Perera',
        'message': 'Please sign the report',
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.background,

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryBlue,
        onPressed: () {},
        child: const Icon(
          Icons.add_comment_outlined,
          color: Colors.white,
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              const SearchBox(hintText: 'Search teacher'),

              const SizedBox(height: 16),

              Row(
                children: const [
                  _FilterChip(
                    text: 'All',
                    color: Color(0xFFD7DDF4),
                    textColor: AppColors.primaryBlue,
                  ),
                  SizedBox(width: 8),
                  _FilterChip(
                    text: 'Unread',
                    color: Color(0xFFF5DE9B),
                    textColor: AppColors.textBlack,
                  ),
                  SizedBox(width: 8),
                  _FilterChip(
                    text: 'Important',
                    color: Color(0xFFCBE8C7),
                    textColor: AppColors.textBlack,
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// Temporary (next step: chat list)
              Text('Chats (${chats.length})'),
            ],
          ),
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;

  const _FilterChip({
    required this.text,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
      ),
    );
  }
}