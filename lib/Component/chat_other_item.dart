import 'package:flutter/material.dart';
import 'package:flutter_learning/data/model/chat.dart';

class ChatOtherItem extends StatelessWidget {
  final Chat chat;
  const ChatOtherItem({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(chat.message!),
    );
  }
}
