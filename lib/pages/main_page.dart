import 'package:flutter/material.dart';
import 'package:flutter_learning/Component/bottom_nav_item.dart';
import 'package:flutter_learning/pages/home_page.dart';
import 'package:flutter_learning/model/user.dart';
import 'package:flutter_learning/pages/user_page.dart';
import 'package:flutter_learning/style/app_colors.dart';

enum Menu { home, messages, add, favorite, user }

class MainPage extends StatefulWidget {
  final UserModel? usrModel;
  const MainPage({super.key, this.usrModel});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Menu initialPage = Menu.home;
  pages() => [
        // I do not know
        const HomePage(),
        const HomePage(),
        const HomePage(),
        const HomePage(),
        UserPage(usrModel: widget.usrModel!),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages()[initialPage.index],
      bottomNavigationBar: MyBottomNavBar(
        currentIndex: initialPage,
        onTap: (pageIndex) {
          setState(() {
            initialPage = pageIndex;
          });
        },
      ),
      // BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.favorite), label: 'Favirite'),
      //     BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
      //     BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.account_circle_rounded), label: 'User'),
      //   ],
      //   type: BottomNavigationBarType.fixed,
      //   showSelectedLabels: false,
      //   showUnselectedLabels: false,
      //   backgroundColor: AppColors.primary,
      //   currentIndex: initialPage,
      //   onTap: (pageIndex) {
      //     setState(() {
      //       initialPage = pageIndex;
      //       print(initialPage);
      //     });
      //   },
      // ),
    );
  }
}

class MyBottomNavBar extends StatelessWidget {
  final Menu currentIndex;
  final ValueChanged<Menu> onTap;
  const MyBottomNavBar(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      height: 87,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 17,
            child: Container(
              height: 70,
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(24),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BottomNavItem(
                    onPress: () => onTap(Menu.home),
                    currentIndex: currentIndex,
                    nameIcon: Menu.home,
                    icon: Icons.home,
                  ),
                  BottomNavItem(
                    onPress: () => onTap(Menu.favorite),
                    currentIndex: currentIndex,
                    nameIcon: Menu.favorite,
                    icon: Icons.favorite_border_outlined,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                  ),
                  BottomNavItem(
                    onPress: () => onTap(Menu.messages),
                    currentIndex: currentIndex,
                    nameIcon: Menu.messages,
                    icon: Icons.chat_outlined,
                  ),
                  BottomNavItem(
                      onPress: () => onTap(Menu.user),
                      currentIndex: currentIndex,
                      nameIcon: Menu.user,
                      icon: Icons.account_circle_rounded),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: () => onTap(Menu.add),
              child: Container(
                height: 64,
                width: 64,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.primary),
                child: Icon(
                  color: currentIndex == Menu.add
                      ? AppColors.black
                      : AppColors.black.withOpacity(0.3),
                  Icons.add,
                  size: 50,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
