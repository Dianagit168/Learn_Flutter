import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_learning/config/app_config.dart';
import 'package:flutter_learning/config/app_rout.dart';
import 'package:flutter_learning/data/response/login_respone.dart';

import 'package:http/http.dart' as http;

class LoginService {
  final String username;
  final String password;

  LoginService(this.username, this.password);
  Future<LoginRespone> call(BuildContext context) async {
    debugPrint('username in service is $username');
    debugPrint('password in service is $password');

    http.Response? result;
    if (username.isNotEmpty && password.isNotEmpty) {
      result = await http.post(
        Uri.parse(AppConfig.baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
          {
            'username': username, //"emilys
            'password': password, //"emilyspass
          },
        ),
      );
      if (result.statusCode == 200) {
        debugPrint('Login Success');
        Navigator.of(context).pushReplacementNamed(AppRoutes.main);
      } else {
        debugPrint('Login fail ');
      }
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            insetPadding: const EdgeInsets.all(14),
            contentPadding: const EdgeInsets.all(8),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    splashRadius: 20,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.cancel),
                  ),
                ),
                const Text('Please input Username and Password')
              ],
            ),
          );
        },
      );
    }

    return LoginRespone.fromJson(jsonDecode(result!.body));
  }
}
