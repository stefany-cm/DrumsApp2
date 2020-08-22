// To parse this JSON data, do
//
//     final theory = theoryFromJson(jsonString);

import 'dart:convert';

List<Theory> theoryFromJson(String str) =>
    List<Theory>.from(json.decode(str).map((x) => Theory.fromJson(x)));

String theoryToJson(List<Theory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Theory {
  Theory({
    this.id,
    this.name,
    this.description,
    this.state,
  });

  int id;
  String name;
  String description;
  int state;

  factory Theory.fromJson(Map<String, dynamic> json) => Theory(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "state": state,
      };
}
