// To parse this JSON data, do
//
//     final matriz = matrizFromJson(jsonString);

import 'dart:convert';

List<List<int>> matrizFromJson(String str) => List<List<int>>.from(
    json.decode(str).map((x) => List<int>.from(x.map((x) => x))));

String matrizToJson(List<List<int>> data) => json.encode(
    List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x)))));
