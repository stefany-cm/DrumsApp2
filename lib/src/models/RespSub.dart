// To parse this JSON data, do
//
//     final respSub = respSubFromJson(jsonString);

import 'dart:convert';

List<RespSub> respSubFromJson(String str) =>
    List<RespSub>.from(json.decode(str).map((x) => RespSub.fromJson(x)));

String respSubToJson(List<RespSub> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RespSub {
  RespSub({
    this.id,
    this.subtheorys,
  });

  int id;
  List<Subtheory> subtheorys;

  factory RespSub.fromJson(Map<String, dynamic> json) => RespSub(
        id: json["id"],
        subtheorys: List<Subtheory>.from(
            json["subtheorys"].map((x) => Subtheory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
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
