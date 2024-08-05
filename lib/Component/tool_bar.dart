import 'package:flutter/material.dart';
import 'package:flutter_learning/style/app_colors.dart';
import 'package:flutter_learning/style/app_text.dart';

class ToolBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? action;
  const ToolBar({super.key, this.title, this.action});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      title: Text(title!, style: AppText.header1),
      centerTitle: false,
      actions: action,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
}
