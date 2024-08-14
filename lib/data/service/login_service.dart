import 'dart:convert';

import 'package:flutter_learning/config/app_config.dart';
import 'package:flutter_learning/data/response/login_respone.dart';

import 'package:http/http.dart' as http;

class LoginService {
  final String username;
  final String password;

  LoginService(this.username, this.password);
  Future<LoginRespone> call() async {
    final result = await http.post(
      Uri.parse(AppConfig.baseUrl),
      body: jsonEncode(
        {
          'username': username, //"emilys
          'password': password, //"emilyspass
        },
      ),
    );
    return LoginRespone.fromJson(jsonDecode(result.body));
  }
}
