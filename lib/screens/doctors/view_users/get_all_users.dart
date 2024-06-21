import 'package:dio/dio.dart';
import 'package:graduate/constants/variables.dart';
import 'package:graduate/models/user_model.dart';
import 'package:graduate/services/cache_helper.dart';

class GetAllUsers {
  Future<List< UserModel>> getAllUsers() async {
    Future.delayed(const Duration(seconds: 2));
      uId = CacheHelper.getData(key: 'uId');
    var response = await Dio().post(
      'http://10.0.2.2:8000/api/auth/user/users',
      options: Options(
        headers: {'Authorization': 'Bearer $uId'},
      ),
      data: {},
    );
    List<dynamic> data = response.data['users'];
    List<UserModel> users = [];
    for (int i = 0; i < data.length; i++) {
      users.add(
        UserModel.fromJson(data[i]),
      );
    }
    return users;
  }
}
