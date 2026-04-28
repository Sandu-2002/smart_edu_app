import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/search_box.dart';
import '../../core/widgets/top_blue_header.dart';
import 'widgets/chat_tile.dart';
import 'widgets/filter_chip.dart';

class TeacherChatScreen extends StatelessWidget {
  const TeacherChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chats = [
      {
        'name': 'Mrs. Sewwandi Perera',
        'role': 'Parent',
        'message': 'Can we discuss the progress report today?',
        'time': '09:30 AM',
        'unread': '2',
      },
      {
        'name': 'Mr. Kasun Silva',
        'role': 'Parent',
        'message': 'Thank you for sharing the homework sheet.',
        'time': 'Yesterday',
        'unread': '1',
      },
      {
        'name': 'Mrs. Anoma Fernando',
        'role': 'Parent',
        'message': 'Please send tomorrow’s class details.',
        'time': 'Mon',
        'unread': '0',
      },
      {
        'name': 'Mr. Ruwan Perera',
        'role': 'Parent',
        'message': 'My child will be absent tomorrow.',
        'time': 'Sun',
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
                      'Chat with parents',
                      style: TextStyle(color: Colors.white70, fontSize: 15),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    const SearchBox(hintText: 'Search parent'),
                    const SizedBox(height: 16),

                    Row(
                      children: const [
                        FilterChipWidget(
                          text: 'All',
                          color: Color(0xFFD7DDF4),
                          textColor: AppColors.primaryBlue,
                        ),
                        SizedBox(width: 8),
                        FilterChipWidget(
                          text: 'Unread',
                          color: Color(0xFFF5DE9B),
                          textColor: AppColors.textBlack,
                        ),
                        SizedBox(width: 8),
                        FilterChipWidget(
                          text: 'Important',
                          color: Color(0xFFCBE8C7),
                          textColor: AppColors.textBlack,
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    ...chats.map(
                      (chat) => ChatTile(
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