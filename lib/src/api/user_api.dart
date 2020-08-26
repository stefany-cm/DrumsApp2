import 'package:dio/dio.dart';

class UserAPI {
  UserAPI._internal();
  static UserAPI _intance = UserAPI._internal();
  static UserAPI get instance => _intance;

  final _dio = Dio();

  getUser(int page) async {
    try {
      final Response response = await this
          ._dio
          .get('https://reqres.in/api/users', queryParameters: {"page": page});

      response.data["data"];
    } catch (e) {}
  }

  login(int page) {
    try {
      this._dio.post('');
    } catch (e) {}
  }
}
