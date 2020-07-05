import 'dart:convert';
import 'package:http/http.dart' as http;

class UserProvider {
  final String _url = "http://192.168.138.129:3000";

  Future createUser2(String email, String password) async {
    print('entrando aca   ' + _url);

    final userData = {'email': email, 'password': password};
    print('Json => ${userData}');
    final url = '$_url';
    final res = await http.post('$_url/user/create2', body: userData);

    Map<String, dynamic> decodeData = json.decode(res.body);

    print('????$decodeData');

    return decodeData;
  }

  Future createUser(String email, String password) async {
    print('entrando aca   ' + _url);

    final userData = {'email': email, 'password': password};
    print('Json => ${userData}');
    final url = '$_url';
    final res = await http.post('$_url/user/create2', body: userData);

    Map<String, dynamic> decodeData = json.decode(res.body);

    print('????$decodeData');

    return decodeData;
  }

  Future auth(String email, String password) async {
    print('entrando aca   ' + _url);

    final authData = {'email': email, 'password': password};
    print('Json => ${authData}');
    final url = '$_url';
    final res = await http.post('$_url/auth/login', body: authData);

    Map<String, dynamic> decodeData = json.decode(res.body);
    // List<dynamic> decodeData = json.decode(res.body);
    print('????$decodeData');

    // if (true) {
    //   return decodeData;
    // } else {
    //   return "no";
    // }

    return decodeData;
  }
}
