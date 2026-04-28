import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

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

      body: Center(
        child: Text('Parent Chat (${chats.length})'),
      ),
    );
  }
}