import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/search_box.dart';
import '../../core/widgets/top_blue_header.dart';

class ParentChatScreen extends StatelessWidget {
  const ParentChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chats = [
      {
        'name': 'Mr. Nuwan Silva',
        'role': 'ICT Teacher',
        'message': 'Homework uploaded for Grade 11-B',
        'time': '09:45 AM',
        'unread': '2',
      },
      {
        'name': 'Mrs. Dilki Perera',
        'role': 'Mathematics Teacher',
        'message': 'Please sign the monthly progress report',
        'time': 'Yesterday',
        'unread': '1',
      },
      {
        'name': 'Mr. Rukshan Fernando',
        'role': 'Science Teacher',
        'message': 'Tomorrow practical starts at 10.00 AM',
        'time': 'Yesterday',
        'unread': '0',
      },
      {
        'name': 'Mrs. Anoma Jayasuriya',
        'role': 'English Teacher',
        'message': 'Your child did very well in the presentation',
        'time': 'Mon',
        'unread': '0',
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryBlue,
        onPressed: () {},
        child: const Icon(Icons.add_comment_outlined, color: Colors.white),
      ),
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
                      'Messages',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Chat with teachers',
                      style: TextStyle(color: Colors.white70, fontSize: 15),
                    ),
                  ],
                ),
              ),
              Padding(
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
                    const SizedBox(height: 18),
                    ...chats.map(
                      (chat) => _ChatTile(
                        name: chat['name']!,
                        role: chat['role']!,
                        message: chat['message']!,
                        time: chat['time']!,
                        unread: chat['unread']!,
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

class _ChatTile extends StatelessWidget {
  final String name;
  final String role;
  final String message;
  final String time;
  final String unread;

  const _ChatTile({
    required this.name,
    required this.role,
    required this.message,
    required this.time,
    required this.unread,
  });

  @override
  Widget build(BuildContext context) {
    final hasUnread = unread != '0';

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: _box(),
      child: Row(
        children: [
          Stack(
            children: [
              const CircleAvatar(radius: 26),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: const Color(0xFF34C759),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textBlack,
                        ),
                      ),
                    ),
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.mutedText,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  role,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.primaryBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        message,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.textBlack,
                          height: 1.4,
                        ),
                      ),
                    ),
                    if (hasUnread) ...[
                      const SizedBox(width: 10),
                      Container(
                        width: 22,
                        height: 22,
                        decoration: const BoxDecoration(
                          color: AppColors.primaryBlue,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            unread,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
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
