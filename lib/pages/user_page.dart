import 'package:flutter/material.dart';
import 'package:flutter_learning/Component/tool_bar.dart';
import 'package:flutter_learning/Component/user_avata.dart';
import 'package:flutter_learning/config/app_icon.dart';
import 'package:flutter_learning/config/app_rout.dart';
import 'package:flutter_learning/config/app_string.dart';
import 'package:flutter_learning/pages/edit_profile_page.dart';
import 'package:flutter_learning/style/app_colors.dart';
import 'package:flutter_learning/style/app_text.dart';

enum ProfileMenu { edit, logout }

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: const Column(
        children: [
          UserAvata(size: 120),
          SizedBox(
            height: 24,
          ),
          Text(
            'Diana Mobile Developer',
            style: AppText.header1,
          ),
          SizedBox(height: 12),
          Text(
            '@diana15',
            style: AppText.subtitle1,
          ),
          SizedBox(
            height: 24,
          ),
          Row(
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
