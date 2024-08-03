import 'package:flutter/material.dart';
import 'package:flutter_learning/pages/home_page.dart';
import 'package:flutter_learning/style/app_colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int initialPage = 0;
  final pages = [
    const HomePage(),
    const HomePage(),
    const HomePage(),
    const HomePage(),
    const HomePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[initialPage],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favirite'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded), label: 'User'),
        ],
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: AppColors.primary,
        currentIndex: initialPage,
        onTap: (pageIndex) {
          setState(() {
            initialPage = pageIndex;
            print(initialPage);
          });
        },
      ),
    );
  }
}
