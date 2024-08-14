import 'package:flutter/material.dart';
import 'package:flutter_learning/model/user.dart';

class AppRepo extends ChangeNotifier {
  String? _token;
  UserModel? userModel;

  set token(String? token) {
    _token = token;
    // print("token ${token}");
    // print("userModel ${userModel}");
  }

  String? get token => _token;
}
