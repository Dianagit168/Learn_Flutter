// import 'package:flutter/material.dart';
// import 'package:flutter_learning/model/user.dart';

// class UserProvider extends InheritedWidget {
//   final Widget child;
//   final UserService? userService;
//   const UserProvider(
//       {super.key, required this.child, required this.userService})
//       : super(child: child);
//   static UserService? of(BuildContext context) {
//     return context
//         .dependOnInheritedWidgetOfExactType<UserProvider>()
//         ?.userService;
//   }

//   @override
//   bool updateShouldNotify(covariant UserProvider oldWidget) {
//     return oldWidget.userService?.userModel?.id !=
//         userService?.userModel?.id; // I do not know why?
//   }
// }

// class UserService {
//   UserModel? _userModel;
//   UserModel? get userModel => _userModel;
//   updateUserModel(UserModel userModel) {
//     _userModel = userModel;
//   }
// }
