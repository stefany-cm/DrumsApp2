// To parse this JSON data, do
//
//     final respGroupDetail = respGroupDetailFromJson(jsonString);

import 'dart:convert';

List<RespGroupDetail> respGroupDetailFromJson(String str) =>
    List<RespGroupDetail>.from(
        json.decode(str).map((x) => RespGroupDetail.fromJson(x)));

String respGroupDetailToJson(List<RespGroupDetail> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RespGroupDetail {
  RespGroupDetail({
    this.id,
    this.name,
    this.key,
    this.image,
    this.userHasGroups,
  });

  int id;
  String name;
  int key;
  String image;
  List<UserHasGroup> userHasGroups;

  factory RespGroupDetail.fromJson(Map<String, dynamic> json) =>
      RespGroupDetail(
        id: json["id"],
        name: json["name"],
        key: json["key"],
        image: json["image"],
        userHasGroups: List<UserHasGroup>.from(
            json["user_has_groups"].map((x) => UserHasGroup.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "key": key,
        "image": image,
        "user_has_groups":
            List<dynamic>.from(userHasGroups.map((x) => x.toJson())),
      };
}

class UserHasGroup {
  UserHasGroup({
    this.id,
    this.user,
  });

  int id;
  User user;

  factory UserHasGroup.fromJson(Map<String, dynamic> json) => UserHasGroup(
        id: json["id"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user.toJson(),
      };
}

class User {
  User({
    this.name,
    this.image,
  });

  String name;
  String image;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
      };
}
