import 'package:flutter/material.dart';
import 'package:flutter_learning/Component/tool_bar.dart';
import 'package:flutter_learning/style/app_colors.dart';
import 'package:flutter_learning/style/app_text.dart';

enum ProfileMenu { edit, logout }

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolBar(
        title: 'Profile',
        action: [
          PopupMenuButton(
            onSelected: (value) {
              switch (value) {
                case ProfileMenu.edit:
                  debugPrint('Edit $value');
                  break;
              }
              switch (value) {
                case ProfileMenu.logout:
                  debugPrint('Logout $value ');
                  break;
              }
            },
            icon: const Icon(Icons.more_vert_rounded),
            color: AppColors.white,
            iconColor: AppColors.white,
            itemBuilder: (context) {
              return [
                const PopupMenuItem(child: Text('Edit')),
                const PopupMenuItem(child: Text('Logout'))
              ];
            },
          ),
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(
          //     Icons.more_vert_outlined,
          //     color: AppColors.white,
          //   ),
          // )
        ],
      ),
      body: Column(
        children: [
          ClipOval(
            child: Image.asset(
              'assets/images/longhair.jpg',
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            'Diana Mobile Developer',
            style: AppText.header1,
          ),
          const SizedBox(height: 12),
          const Text(
            '@diana15',
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
