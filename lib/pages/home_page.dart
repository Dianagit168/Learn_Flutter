import 'package:flutter/material.dart';
import 'package:flutter_learning/Component/post_item.dart';
import 'package:flutter_learning/Component/tool_bar.dart';
import 'package:flutter_learning/config/app_rout.dart';
import 'package:flutter_learning/config/app_string.dart';
import 'package:flutter_learning/style/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolBar(
        title: AppStrings.appName,
        action: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.nearby);
            },
            icon: const Icon(Icons.location_on_outlined),
            color: AppColors.white,
          ),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return PostItem(
            index: index,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 8,
          );
        },
        itemCount: 10,
      ),
    );
  }
}
