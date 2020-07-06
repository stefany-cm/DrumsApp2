// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.dateN,
    this.name,
    this.email,
    this.password,
    this.imageUrl,
    this.genre,
    this.state,
  });

  String id;
  DateTime dateN;
  String name;
  String email;
  String password;
  String imageUrl;
  String genre;
  int state;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        dateN: DateTime.parse(json["dateN"]),
        name: json["name"],
        email: json["email"],
        password: json["password"],
        imageUrl: json["imageUrl"],
        genre: json["genre"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dateN":
            "${dateN.year.toString().padLeft(4, '0')}-${dateN.month.toString().padLeft(2, '0')}-${dateN.day.toString().padLeft(2, '0')}",
        "name": name,
        "email": email,
        "password": password,
        "imageUrl": imageUrl,
        "genre": genre,
        "state": state,
      };
}
