import 'package:flutter/material.dart';
import 'package:flutter_learning/pages/main_page.dart';
import 'package:flutter_learning/style/app_colors.dart';

class BottomNavItem extends StatelessWidget {
  final VoidCallback onPress;
  final Menu currentIndex;
  final Menu nameIcon;
  final IconData icon;

  const BottomNavItem(
      {super.key,
      required this.onPress,
      required this.currentIndex,
      required this.nameIcon,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPress,
      icon: Icon(
        icon,
        color: currentIndex == nameIcon
            ? AppColors.black
            : AppColors.black.withOpacity(0.3),
      ),
    );
  }
}
