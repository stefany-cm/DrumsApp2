import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  final String _url = "http://192.168.1.11:3000";

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
    if (res.statusCode == 201) {
      final body = await res.body;

      // final user = await this.jsonDecode(body);
      // print(await _userPreference.decodeJWT());
      // return {"status": true, "token": user['token']};
      //   Navigator.of(context).pushReplacementNamed('/welcome');
      //   print("entro 201");
      // } else {
      //   print("No ");
      //   Navigator.of(context).pushReplacementNamed('/signUpBasic');

      // alertError("Upss!", context, "El usuario y/o contraseñas incorrectos");
    }

    // if (true) {
    //   return decodeData;
    // } else {
    //   return "no";
    // }

    ///:v precerencia de usaurio buscar xq la palabra de Yisus es ley :v
    // decodeJWT({String jwt}) async {
    //   String _tokenJWT = jwt == null ? _prefs.getString("token") : jwt;
    //   final user = await json.decode(ascii
    //       .decode(base64.decode(base64.normalize(_tokenJWT.split(".")[1]))));
    //   return user;
    // }

    return decodeData;
  }
}
