// To parse this JSON data, do
//
//     final respRhythm = respRhythmFromJson(jsonString);

import 'dart:convert';

List<RespRhythm> respRhythmFromJson(String str) =>
    List<RespRhythm>.from(json.decode(str).map((x) => RespRhythm.fromJson(x)));

String respRhythmToJson(List<RespRhythm> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RespRhythm {
  RespRhythm({
    this.id,
    this.name,
    this.state,
  });

  int id;
  String name;
  int state;

  factory RespRhythm.fromJson(Map<String, dynamic> json) => RespRhythm(
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
