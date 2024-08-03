import 'package:flutter/material.dart';
import 'package:flutter_learning/style/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const Text(
          'Flutter5minutes',
          style: TextStyle(
            color: AppColors.white,
          ),
        ),
        centerTitle: false,
        actions: const [
          Icon(
            Icons.location_on_outlined,
            color: AppColors.white,
          ),
        ],
      ),
    );
  }
}
