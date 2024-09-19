import 'package:flutter_learning/data/model/user.dart';
import 'package:flutter_learning/data/service/base_service.dart';

class GetAllUserService extends ServiceBase<List<UserModel>> {
  @override
  Future<List<UserModel>> call() async {
    final result = await get('users');
    return List.generate(
      result['users'].length,
      (index) => UserModel.fromJson(
        result['users'][index],
      ),
    );
  }
}
