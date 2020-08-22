import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:drumsapp2/src/models/theory.dart';
import 'package:flutter/cupertino.dart';

class PartitureProvider {
  //final String _url = "http://192.168.138.129:3000";
  final String _url = "http://192.168.1.29:3000";

  Future getPartiture() async {
    print('entrando  getPartiture' + _url);

    final res = await http.get('$_url/partitura/get');

    Map<String, dynamic> decodeData = json.decode(res.body);

    print('????$decodeData');

    return decodeData;
  }

  Future getRhythmAll() async {
    print('entrando  getRhythmAll ' + _url);

    final res = await http.get('$_url/partitura/getRhythm');

    // Map<String, dynamic> decodeData = json.decode(res.body);
    List<dynamic> decodeData = json.decode(res.body);

    print('????$decodeData');

    return decodeData;
  }

  Future<List<Theory>> getTheory() async {
    print('entrando  getTeoria ' + _url);

    final res = await http.get('$_url/partitura/getTheory');

    print(theoryFromJson(res.body));
    return theoryFromJson(res.body);
  }

  Future getSubTheory(int id, BuildContext context) async {
    print('entrando  getSubTeoria ' + _url);

    final res = await http.get('$_url/partitura/getTheory/${id}');

    print(theoryFromJson(res.body));
    return theoryFromJson(res.body);
  }
  //getRhythm

  Future createUser(String email, String password) async {
    print('entrando aca   ' + _url);

    final userData = {'email': email, 'password': password};
    print('Json => ${userData}');
    //final url = '$_url';
    final res = await http.post('$_url/user/create2', body: userData);

    Map<String, dynamic> decodeData = json.decode(res.body);

    print('????$decodeData');

    return decodeData;
  }

  Future auth(String email, String password, BuildContext context) async {
    print('entrando aca   ' + _url);

    final authData = {'email': email, 'password': password};
    print('Json => ${authData}');
    //final url = '$_url';
    final res = await http.post('$_url/auth/login', body: authData);

    Map<String, dynamic> decodeData = json.decode(res.body);
    // List<dynamic> decodeData = json.decode(res.body);
    print('????$decodeData');

    return decodeData;
  }
}
