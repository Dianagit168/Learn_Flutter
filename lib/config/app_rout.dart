import 'package:flutter_learning/pages/edit_profile_page.dart';
import 'package:flutter_learning/pages/home_page.dart';
import 'package:flutter_learning/pages/login_page.dart';
import 'package:flutter_learning/pages/main_page.dart';
import 'package:flutter_learning/model/user.dart';
import 'package:flutter_learning/pages/nearby_page.dart';

class AppRoutes {
  static final pages = {
    '/': (context) => LoginPage(),
    '/home': (context) => const HomePage(),
    '/main': (context) => const MainPage(),
    '/edit_profile': (context) => const EditProfilePage(),
    nearby: (context) => const NearbyPage(),
    // user: (context) => UserPage(),
    //'/test': (context) => const TestPage(),
  };

  static const login = '/';
  static const home = '/home';
  static const main = '/main';
  static const editProfile = '/edit_profile';
  static const nearby = '/nearby';
  // static const user = '/user';
}
