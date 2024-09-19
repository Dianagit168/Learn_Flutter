import 'package:flutter/material.dart';
import 'package:flutter_learning/data/model/chat.dart';
import 'package:flutter_learning/style/app_colors.dart';

class ChatMeItem extends StatelessWidget {
  final Chat chat;
  const ChatMeItem({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        chat.message!,
        style: const TextStyle(color: AppColors.primary),
      ),
    );
  }
}
