import 'package:flutter/material.dart';
import 'package:flutter_learning/Component/app_text_field.dart';
import 'package:flutter_learning/pages/home_page.dart';
import 'package:flutter_learning/provider/app_repo.dart';
import 'package:flutter_learning/provider/post_provider.dart';
import 'package:flutter_learning/style/app_colors.dart';
import 'package:flutter_learning/style/app_text.dart';
import 'package:provider/provider.dart';

class NewPostModal extends StatelessWidget {
  const NewPostModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Insert Message',
            style: AppText.header1,
          ),
          const SizedBox(height: 16),
          AppTextField(
            hint: 'Message',
            onChange: (value) {
              context.read<PostProvider>().description = value;
              print('Message ${value}');
            },
          ),
          const SizedBox(height: 16),
          const Text('Add Image', style: AppText.header1),
          const SizedBox(height: 16),
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(16)),
            child: const Center(
              child: Text(
                'Upload from gallery',
                style: AppText.body2,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Or'),
          const SizedBox(height: 16),
          OutlinedButton(onPressed: () {}, child: const Text('Camera')),
          const SizedBox(height: 16),
          ElevatedButton(
              onPressed: () {
                final String token = context.read<AppRepo>().token!;
                context.read<PostProvider>().createPost(token).then((value) {
                  print('OnPress post $token ');
                  Navigator.of(context).pop();
                });
              },
              child: const Text('Create Post')),
        ],
      ),
    );
  }
}
