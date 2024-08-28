import 'package:flutter/material.dart';
import 'package:flutter_learning/config/app_icon.dart';
import 'package:flutter_learning/data/model/post.dart';
import 'package:flutter_learning/style/app_text.dart';

class PostItem extends StatelessWidget {
  final int index;
  final Post post;
  const PostItem({super.key, required this.index, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Column(
        children: [
          Row(
            children: [
              ClipOval(
                child: Image.asset(
                  AppIcons.imLongHair,
                  height: 45,
                  width: 45,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                'Diana ${index + 1} and post Id ${post.id}',
                style: AppText.subtitle3,
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Image.network(
            post.thumbnail!,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            post.description!,
            style: AppText.subtitle3,
          )
        ],
      ),
    );
  }
}
