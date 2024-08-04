import 'package:flutter/material.dart';
import 'package:flutter_learning/style/app_text.dart';

class PostItem extends StatelessWidget {
  final int index;
  const PostItem({super.key, required this.index});

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
                  'assets/images/profile.png',
                  height: 45,
                  width: 45,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                'Diana ${index + 1}',
                style: AppText.subtitle3,
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Image.asset(
            'assets/images/prongery.jpeg',
            width: double.infinity,
            fit: BoxFit.cover,
            
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            'Nou Ousakphear នូ ឧសភា - ព្រងើយ [Official MV] | Facebook',
            style: AppText.subtitle3,
          )
        ],
      ),
    );
  }
}
