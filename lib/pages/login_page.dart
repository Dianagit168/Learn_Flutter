import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_learning/config/app_icon.dart';
import 'package:flutter_learning/config/app_rout.dart';

import 'package:flutter_learning/model/user.dart';
import 'package:flutter_learning/user_provider.dart';

import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(
                height: 68,
              ),
              const Text(
                'Hello Welcome Back',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Login to Continue',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              TextField(
                controller: userNameController,
                decoration: InputDecoration(
                  hintText: 'Username',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  fillColor: Colors.white.withOpacity(0.5),
                  filled: true,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  fillColor: Colors.white.withOpacity(0.5),
                  filled: true,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(foregroundColor: Colors.white),
                  child: const Text('Forgot password'),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  final user = await fetchUser(
                    context,
                    userNameController.text,
                    passwordController.text,
                  );

                  UserProvider.of(context)?.updateUserModel(user!);
                  Navigator.of(context).pushReplacementNamed(AppRoutes.main);
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.amber,
                    minimumSize: const Size(250, 48)),
                child: const Text('Login'),
              ),
              const SizedBox(
                height: 62,
              ),
              const Text(
                'Or sign in with',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    minimumSize: const Size(250, 48)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      height: 50,
                      width: 50,
                      image: AssetImage(AppIcons.imGoogle),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text('Login with google'),
                  ],
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    minimumSize: const Size(250, 48)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      height: 35,
                      width: 35,
                      image: AssetImage(AppIcons.imFacebook),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text('Login with facebook'),
                  ],
                ),
              ),
              Row(
                children: [
                  const Text(
                    'Do not have account?',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(foregroundColor: Colors.amber),
                    child: const Text('Sign up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future handleLogin() async {
  //   final response = await http.post(
  //       Uri.parse('https://dummyjson.com/auth/login'),
  //       body: jsonEncode({
  //         "username": userNameController.text,
  //         "password": passwordController.text
  //       }));
  //   if (response.statusCode == 200) {
  //     print(response.body);
  //   } else {
  //     print("Not Success");
  //   }
  //   throw Exception('Error');
  // }
  Future<UserModel?> fetchUser(
      context, String username, String password) async {
    if (username.isNotEmpty && password.isNotEmpty) {
      http.Response response;
      response = await http.post(
        Uri.parse('https://dummyjson.com/auth/login'),
        body: {
          'username': username, //"emilys
          'password': password, //"emilyspass
        },
      );
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final userModel = UserModel.fromJson(json);

        debugPrint('Success ${response.body}');
        return userModel;
      } else {
        Navigator.pop(context);
        print('Fail');
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
                const Text('Please input email and password')
              ],
            ),
          );
        },
      );
    }
    return null;
  }
}
