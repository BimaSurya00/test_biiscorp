import 'package:dio/dio.dart';
import 'package:test_biiscorp/model/user.dart';

class RemoteDataSource {
  final dio = Dio(BaseOptions(baseUrl: 'https://reqres.in/api'));

  Future<DataUser> getUsers() async {
    final response = await dio.get('/users');

    return DataUser.fromJson(response.data);
  }
}
