import 'package:flutter_learning/data/model/user.dart';

class Chat {
  final String? message;
  final UserModel? user;

  Chat({required this.message, required this.user});
  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        message: json['message'],
        user: UserModel.fromJson(
          json['user'],
        ),
      );
}
