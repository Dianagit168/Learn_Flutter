import 'package:flutter/material.dart';
import 'package:flutter_learning/config/app_rout.dart';
import 'package:flutter_learning/provider/app_repo.dart';
import 'package:flutter_learning/provider/post_provider.dart';

import 'package:flutter_learning/style/app_colors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AppRepo>(
        create: (context) => AppRepo(),
      ),
      ChangeNotifierProvider<PostProvider>(
        create: (context) => PostProvider(),
      ),
    ],
    child: const MyApp(),
  ));
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

      initialRoute: AppRoutes.login, ////home: const LoginPage(),
      routes: AppRoutes.pages,
      // routes: {
      //   '/': (context) => const LoginPage(),
      //   '/home': (context) => const HomePage(),
      //   '/main': (context) => const MainPage(),
      //   '/test': (context) => const TestPage(),
      //   '/edit_profile': (context) => const EditProfilePage(),
      // },
    );
  }
}
