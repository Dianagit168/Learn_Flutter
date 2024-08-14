import 'package:flutter/material.dart';
import 'package:flutter_learning/Component/tool_bar.dart';
import 'package:flutter_learning/Component/user_avata.dart';

import 'package:flutter_learning/config/app_rout.dart';
import 'package:flutter_learning/config/app_string.dart';
import 'package:flutter_learning/provider/app_repo.dart';

import 'package:flutter_learning/style/app_colors.dart';
import 'package:flutter_learning/style/app_text.dart';

import 'package:provider/provider.dart';

enum ProfileMenu { edit, logout }

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    //final user =
    // context.dependOnInheritedWidgetOfExactType<UserProvider>()?.userService;
    final user = Provider.of<AppRepo>(context).userModel;
    return Scaffold(
      appBar: ToolBar(
        title: AppStrings.profile,
        action: [
          PopupMenuButton<ProfileMenu>(
            onSelected: (value) {
              switch (value) {
                case ProfileMenu.edit:
                  //debugPrint('Edit $value');
                  Navigator.of(context).pushNamed(AppRoutes.editProfile);
                  break;
                case ProfileMenu.logout:
                  //  debugPrint('Logout $value ');
                  break;
                default:
              }
            },
            icon: const Icon(Icons.more_vert_rounded),
            color: AppColors.white,
            iconColor: AppColors.white,
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: ProfileMenu.edit,
                  child: Text(AppStrings.edit),
                ),
                const PopupMenuItem(
                  value: ProfileMenu.logout,
                  child: Text(AppStrings.logout),
                )
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const UserAvata(size: 120),
          const SizedBox(
            height: 24,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "user!.firstName!",
                style: AppText.header1,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                " user.lastName",
                style: AppText.header1,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "${user!.id} ${user.username}",
            style: AppText.subtitle1,
          ),
          const SizedBox(
            height: 24,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    '10k ',
                    style: AppText.header2,
                  ),
                  Text(
                    'Followers',
                    style: AppText.subtitle1,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '10k ',
                    style: AppText.header2,
                  ),
                  Text(
                    'Followers',
                    style: AppText.subtitle1,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '10k ',
                    style: AppText.header2,
                  ),
                  Text(
                    'Followers',
                    style: AppText.subtitle1,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
