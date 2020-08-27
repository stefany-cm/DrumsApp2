import 'dart:convert';
import 'package:http/http.dart' as http;

class Servicion {
  //final String _url = "http://192.168.138.129:3000"; //JP
  final String _url = "http://192.168.138.129:3000"; //St

  Future createUser() async {
    print('entrando aca 1  ' + _url);
    final url = '$_url';
    final res = await http.get('$_url/user/get');

    List<dynamic> decodeData = json.decode(res.body);
    print('usuario creado$decodeData');

    return "";
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
