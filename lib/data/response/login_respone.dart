import 'package:flutter_learning/model/user.dart';

class LoginRespone {
  final UserModel userModel;
  final String? token;

  LoginRespone(this.userModel, this.token);

  factory LoginRespone.fromJson(Map<String, dynamic> json) => LoginRespone(
        UserModel.fromJson(json),
        json['token'],
      );
}
