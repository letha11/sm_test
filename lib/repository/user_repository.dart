import 'package:dio/dio.dart';
import 'package:suitmedia_test/model/pagination.dart';
import 'package:suitmedia_test/model/user.dart';

class UserRepository {
  final _dio = Dio();

  Future<List<User>?> getUsers(int page) async {
    final response =
        await _dio.get('https://reqres.in/api/users', queryParameters: {
      'page': page,
      'per_page': 10,
    });

    final pagination =
        Pagination<User>.fromJson(response.data, (json) => User.fromJson(json));

    return pagination.data;
  }
}
