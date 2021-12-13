// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.id,
    this.authId,
    this.username,
    this.country,
    this.date,
    this.v,
  });

  String? id;
  String? authId;
  String? username;
  String? country;
  DateTime? date;
  int? v;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        id: json["_id"],
        authId: json["auth_id"],
        username: json["username"],
        country: json["country"],
        date: DateTime.parse(json["date"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "auth_id": authId,
        "username": username,
        "country": country,
        "date": date!.toIso8601String(),
        "__v": v,
      };
}
