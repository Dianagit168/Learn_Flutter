import 'package:flutter/material.dart';
import 'package:flutter_learning/pages/home_page.dart';

import 'package:flutter_learning/pages/login_page.dart';
import 'package:flutter_learning/pages/main_page.dart';
import 'package:flutter_learning/pages/test_page.dart';
import 'package:flutter_learning/style/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'Urbanist',
          scaffoldBackgroundColor: AppColors.background,
         // brightness: Brightness.dark
          
          ),
      //home: const LoginPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/main': (context) => const MainPage(),
        '/test': (context) => const TestPage(),
      },
    );
  }
}
