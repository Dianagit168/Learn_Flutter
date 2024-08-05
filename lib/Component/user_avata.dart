import 'package:flutter/material.dart';
import 'package:flutter_learning/config/app_icon.dart';

class UserAvata extends StatelessWidget {
  final double size;
  const UserAvata({super.key, this.size = 40});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        AppIcons.imLongHair,
        height: size,
        width: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
