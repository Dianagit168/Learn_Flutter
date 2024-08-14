import 'package:flutter/material.dart';
import 'package:flutter_learning/data/response/login_respone.dart';
import 'package:flutter_learning/data/service/login_service.dart';

class LoginProvider extends ChangeNotifier {
  var username = '';
  var password = '';
  Future<LoginRespone> handleLogin() async {
    return LoginService(username, password).call();
  }
}

// Future<UserModel?> fetchUser(
//       context, String username, String password) async {
//     if (username.isNotEmpty && password.isNotEmpty) {
//       http.Response response;
//       response = await http.post(
//         Uri.parse('https://dummyjson.com/auth/login'),
//         body: {
//           'username': username, //"emilys
//           'password': password, //"emilyspass
//         },
//       );
//       if (response.statusCode == 200) {
//         final json = jsonDecode(response.body);
//         final userModel = UserModel.fromJson(json);

//         debugPrint('Success ${response.body}');
//         return userModel;
//       } else {
//         Navigator.pop(context);
//         print('Fail');
//       }
//     } else {
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             insetPadding: const EdgeInsets.all(14),
//             contentPadding: const EdgeInsets.all(8),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: IconButton(
//                     splashRadius: 20,
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: const Icon(Icons.cancel),
//                   ),
//                 ),
//                 const Text('Please input email and password')
//               ],
//             ),
//           );
//         },
//       );
//     }
//     return null;
//   }
