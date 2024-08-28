import 'package:flutter_learning/data/model/user.dart';

class LoginRespone {
  final UserModel userModel;
  final String? token;

  LoginRespone(this.userModel, this.token);

  factory LoginRespone.fromJson(Map<String, dynamic> json) => LoginRespone(
        //do not know
        UserModel.fromJson(json),
        json['token'],
      );
}
