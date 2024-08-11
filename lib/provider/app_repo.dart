import 'package:flutter/material.dart';
import 'package:flutter_learning/model/user.dart';

class AppRepo extends ChangeNotifier {
  String? _token;
  UserModel? _userModel;
}
