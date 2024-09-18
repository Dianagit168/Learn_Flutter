import 'package:flutter/material.dart';
import 'package:flutter_learning/data/model/post.dart';
import 'package:flutter_learning/data/service/create_post_service%20.dart';
import 'package:flutter_learning/data/service/get_post_service.dart';
import 'package:flutter_learning/utils/utils.dart';

import 'package:image_picker/image_picker.dart';

class PostProvider extends ChangeNotifier {
  final List<Post> list = [];
  String description = '';
  String? thumbnail;
  getPost() async {
    list.clear();
    list.addAll(await GetPostService().call());
    notifyListeners();
  }

  Future<void> createPost(String token) async {
    await CreatePostService(
            description: description, thumbnail: thumbnail, token: token)
        .call();
    description = '';
    thumbnail = null;
    getPost();
  }

  pickImage(ImageSource pathThumbnail) async {
    try {
      final path = await Utils.pickImage(pathThumbnail);
      thumbnail = path;

      notifyListeners();
      print("Post image $path");
    } catch (e) {
      print(e);
    }
  }

  deleteImage() {
    thumbnail = null;
    notifyListeners();
  }

  // Future<void> createPost(BuildContext context) async {
  //   final body = {
  //     "description": description,
  //     "thumbnail": thumbnail,
  //   };
  //   final response = await http.post(
  //     Uri.parse('https://dummyjson.com/products/add'),
  //     headers: {'Content-Type': 'application/json'},
  //     body: jsonEncode(body),
  //   );
  //   if (response.statusCode == 201) {
  //     debugPrint(response.body);

  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text('Created done'),
  //       ),
  //     );
  //   } else {
  //     debugPrint('Created failed');
  //     debugPrint(response.body);
  //   }
  // }
}
