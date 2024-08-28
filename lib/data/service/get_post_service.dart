import 'package:flutter_learning/data/model/post.dart';
import 'package:flutter_learning/data/service/base_service.dart';

class GetPostService extends ServiceBase<List<Post>> {
  @override
  Future<List<Post>> call() async {
    final result = await get('products');
    return List.generate(
      result['products'].length,
      (index) => Post.fromJson(
        result['products'][index],
      ),
    );
  }
}
