// To parse this JSON data, do
//
//     final respPractice = respPracticeFromJson(jsonString);

import 'dart:convert';

List<RespPractice> respPracticeFromJson(String str) => List<RespPractice>.from(
    json.decode(str).map((x) => RespPractice.fromJson(x)));

String respPracticeToJson(List<RespPractice> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RespPractice {
  RespPractice({
    this.id,
    this.name,
    this.state,
  });

  int id;
  String name;
  int state;

  factory RespPractice.fromJson(Map<String, dynamic> json) => RespPractice(
        id: json["id"],
        name: json["name"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "state": state,
      };
}
