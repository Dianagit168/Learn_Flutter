import 'package:flutter_learning/data/service/base_service.dart';

class CreatePostService extends ServiceBase<void> {
  final String description;
  final String? thumbnail;
  final String? token;

  CreatePostService(
      {required this.description,
      required this.thumbnail,
      required this.token});
  @override
  Future<void> call() async {
    final body = {'description': description};
    if (thumbnail != null) {
      body['thumbnail'] = thumbnail!;
    }

    await post('products/add', body: body, token: token);
  }
}
