// To parse this JSON data, do
//
//     final respTheoryAndSub = respTheoryAndSubFromJson(jsonString);

import 'dart:convert';

List<RespTheoryAndSub> respTheoryAndSubFromJson(String str) =>
    List<RespTheoryAndSub>.from(
        json.decode(str).map((x) => RespTheoryAndSub.fromJson(x)));

String respTheoryAndSubToJson(List<RespTheoryAndSub> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RespTheoryAndSub {
  RespTheoryAndSub({
    this.id,
    this.name,
    this.description,
    this.subtheorys,
  });

  int id;
  String name;
  String description;
  List<Subtheory> subtheorys;

  factory RespTheoryAndSub.fromJson(Map<String, dynamic> json) =>
      RespTheoryAndSub(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        subtheorys: List<Subtheory>.from(
            json["subtheorys"].map((x) => Subtheory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "subtheorys": List<dynamic>.from(subtheorys.map((x) => x.toJson())),
      };
}

class Subtheory {
  Subtheory({
    this.id,
    this.name,
    this.description,
    this.icon,
    this.url,
    this.state,
  });

  int id;
  String name;
  String description;
  String icon;
  String url;
  int state;

  factory Subtheory.fromJson(Map<String, dynamic> json) => Subtheory(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        icon: json["icon"],
        url: json["url"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "icon": icon,
        "url": url,
        "state": state,
      };
}
