import 'package:flutter/material.dart';
import 'package:flutter_learning/Component/app_text_field.dart';
import 'package:flutter_learning/Component/tool_bar.dart';
import 'package:flutter_learning/Component/user_avata.dart';
import 'package:flutter_learning/config/app_string.dart';
import 'package:flutter_learning/style/app_colors.dart';

enum Gender {
  none,
  male,
  feMale,
  other,
}

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  var gender = Gender.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ToolBar(
        title: AppStrings.editProfile,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  const UserAvata(size: 150),
                  Positioned(
                    bottom: 0,
                    right: 30,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: const Icon(
                        Icons.edit,
                        size: 17,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const AppTextField(hint: AppStrings.firstName),
              const SizedBox(
                height: 14,
              ),
              const AppTextField(hint: AppStrings.lastName),
              const SizedBox(
                height: 14,
              ),
              const AppTextField(hint: AppStrings.phoneNumber),
              const SizedBox(
                height: 14,
              ),
              const AppTextField(hint: AppStrings.location),
              const SizedBox(
                height: 14,
              ),
              const AppTextField(hint: AppStrings.birthday),
              const SizedBox(
                height: 14,
              ),
              Container(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 6),
                decoration: BoxDecoration(
                  color: AppColors.fieldColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(AppStrings.gender),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            visualDensity: const VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity),
                            title: const Text(AppStrings.male),
                            value: Gender.male,
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                print('Click $value');
                                gender = value!;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            visualDensity: const VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity),
                            title: const Text(AppStrings.female),
                            value: Gender.feMale,
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                print('Click $value');
                                gender = value!;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            visualDensity: const VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity),
                            title: const Text(AppStrings.other),
                            value: Gender.other,
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                print('Click $value');
                                gender = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
