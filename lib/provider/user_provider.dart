import 'package:flutter/material.dart';
import 'package:flutter_learning/data/model/user.dart';
import 'package:flutter_learning/data/service/get_all_user_service.dart';

class UserProvider extends ChangeNotifier {
  Future<List<UserModel>> getAllUser() async {
    return await GetAllUserService().call();
  }
}
