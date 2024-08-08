import 'package:flutter/material.dart';
import 'package:flutter_learning/config/app_rout.dart';
import 'package:flutter_learning/model/user.dart';

import 'package:flutter_learning/style/app_colors.dart';
import 'package:flutter_learning/user_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UserProvider(
      userModel: UserModel(1, 'username', 'firstName', 'lastName', 'gender'),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'Urbanist',
          scaffoldBackgroundColor: AppColors.background,
          // brightness: Brightness.dark
        ),

        initialRoute: AppRoutes.login, ////home: const LoginPage(),
        routes: AppRoutes.pages,
        // routes: {
        //   '/': (context) => const LoginPage(),
        //   '/home': (context) => const HomePage(),
        //   '/main': (context) => const MainPage(),
        //   '/test': (context) => const TestPage(),
        //   '/edit_profile': (context) => const EditProfilePage(),
        // },
      ),
    );
  }
}
