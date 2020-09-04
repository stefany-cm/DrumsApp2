import 'dart:convert';
import 'dart:async';
import 'package:drumsapp2/src/models/Matriz.dart';
import 'package:drumsapp2/src/models/RespRhythm.dart';
import 'package:drumsapp2/src/models/RespTheoryAndSub.dart';
import 'package:http/http.dart' as http;

import 'package:drumsapp2/src/models/theory.dart';
import 'package:flutter/cupertino.dart';

class PartitureProvider {
  //final String _url = "http://192.168.138.129:3000";
  final String _url = "http://192.168.1.9:3000";

  Future<List<List<int>>> getPartiture(int id) async {
    print('entrando  getPartiture' + _url);

    final res = await http.get('$_url/partitura/getId/${id}');

    // Map<String, dynamic> decodeData = json.decode(res.body);

    // print('????$decodeData');

    return matrizFromJson(res.body);
  }

  Future<List<RespRhythm>> getRhythmAll() async {
    print('entrando  getRhythmAll ' + _url);

    final res = await http.get('$_url/partitura/getRhythm');

    // Map<String, dynamic> decodeData = json.decode(res.body);
    List<dynamic> decodeData = json.decode(res.body);

    print('????$decodeData');
    //  print(respTheoryAndSubFromJson(res.body));
    return respRhythmFromJson(res.body);
  }

  Future<List<RespTheoryAndSub>> getTheoryAndSub() async {
    print('entrando  getTheoryAndSub' + _url);

    final res = await http.get('$_url/partitura/getTheoryAndSub');

    print(respTheoryAndSubFromJson(res.body));
    return respTheoryAndSubFromJson(res.body);
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

}
