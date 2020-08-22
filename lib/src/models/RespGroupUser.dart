// To parse this JSON data, do
//
//     final respGroupUser = respGroupUserFromJson(jsonString);

import 'dart:convert';

List<RespGroupUser> respGroupUserFromJson(String str) =>
    List<RespGroupUser>.from(
        json.decode(str).map((x) => RespGroupUser.fromJson(x)));

String respGroupUserToJson(List<RespGroupUser> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RespGroupUser {
  RespGroupUser({
    this.name,
    this.userHasGroups,
  });

  String name;
  List<UserHasGroup> userHasGroups;

  factory RespGroupUser.fromJson(Map<String, dynamic> json) => RespGroupUser(
        name: json["name"],
        userHasGroups: List<UserHasGroup>.from(
            json["user_has_groups"].map((x) => UserHasGroup.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "user_has_groups":
            List<dynamic>.from(userHasGroups.map((x) => x.toJson())),
      };
}

class UserHasGroup {
  UserHasGroup({
    this.id,
    this.group,
  });

  int id;
  Group group;

  factory UserHasGroup.fromJson(Map<String, dynamic> json) => UserHasGroup(
        id: json["id"],
        group: Group.fromJson(json["group"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "group": group.toJson(),
      };
}

class Group {
  Group({
    this.id,
    this.name,
    this.key,
    this.image,
  });

  int id;
  String name;
  int key;
  String image;

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json["id"],
        name: json["name"],
        key: json["key"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "key": key,
        "image": image,
      };
}
