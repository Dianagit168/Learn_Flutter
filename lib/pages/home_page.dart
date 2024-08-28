import 'package:flutter/material.dart';
import 'package:flutter_learning/Component/post_item.dart';
import 'package:flutter_learning/Component/tool_bar.dart';
import 'package:flutter_learning/config/app_rout.dart';
import 'package:flutter_learning/config/app_string.dart';
import 'package:flutter_learning/provider/post_provider.dart';
import 'package:flutter_learning/style/app_colors.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<PostProvider>().getPost();
  }

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
      body: Consumer<PostProvider>(
        builder: (BuildContext context, value, child) {
          return ListView.separated(
              itemBuilder: (context, index) {
                return PostItem(
                  index: index,
                  post: value.list[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 8,
                );
              },
              itemCount: value.list.length);
        },
      ),
    );
  }
}
