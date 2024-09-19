import 'package:flutter/material.dart';
import 'package:flutter_learning/Component/chat_me_item.dart';
import 'package:flutter_learning/Component/chat_other_item.dart';

import 'package:flutter_learning/provider/app_repo.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final provider = context.read<AppRepo>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Text('This is message');
        },
        // itemBuilder: (context, index) {
        //   final chat = provider.chats[index];
        //   if (chat.user?.id == provider.userModel?.id) {
        //     return ChatMeItem(
        //       chat: chat,
        //     );
        //   }
        //   return ChatOtherItem(chat: chat);
        // },
      ),
    );
  }
}
