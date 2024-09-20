import 'package:flutter_learning/pages/edit_profile_page.dart';
import 'package:flutter_learning/pages/home_page.dart';
import 'package:flutter_learning/pages/login_page.dart';
import 'package:flutter_learning/pages/main_page.dart';

import 'package:flutter_learning/pages/nearby_page.dart';
import 'package:flutter_learning/pages/user_page.dart';
import 'package:flutter_learning/provider/login_provider.dart';
import 'package:provider/provider.dart';

class AppRoutes {
  static final pages = {
    login: (context) => ChangeNotifierProvider(
          create: (context) => LoginProvider(),
          child: const LoginPage(),
        ),
    home: (context) => const HomePage(),
    main: (context) => const MainPage(),
    editProfile: (context) => const EditProfilePage(),
    nearby: (context) => const NearbyPage(),
    user: (context) => const UserPage(),
    //'/test': (context) => const TestPage(),
  };

  static const login = '/';
  static const home = '/home';
  static const main = '/main';
  static const editProfile = '/edit_profile';
  static const nearby = '/nearby';
  static const user = '/user';
}
