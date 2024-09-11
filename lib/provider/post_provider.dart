import 'package:flutter/material.dart';
import 'package:flutter_learning/data/model/post.dart';
import 'package:flutter_learning/data/service/create_post_service%20.dart';
import 'package:flutter_learning/data/service/get_post_service.dart';

class PostProvider extends ChangeNotifier {
  final List<Post> list = [];
  String description = '';
  getPost() async {
    list.clear();
    list.addAll(await GetPostService().call());
    notifyListeners();
  }

  Future<void> createPost(String token) async {
    await CreatePostService(
            description: description, thumbnail: null, token: token)
        .call();
    description = '';
    getPost();
  }
}
