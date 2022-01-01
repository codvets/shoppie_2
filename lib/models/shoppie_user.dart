// To parse this JSON data, do
//
//     final shoppieUser = shoppieUserFromJson(jsonString);

import 'dart:convert';

ShoppieUser shoppieUserFromJson(String str) =>
    ShoppieUser.fromJson(json.decode(str));

String shoppieUserToJson(ShoppieUser data) => json.encode(data.toJson());

class ShoppieUser {
  ShoppieUser({
    required this.name,
    required this.email,
    required this.type,
  });

  String name;
  String email;
  UserType type;

  factory ShoppieUser.fromJson(Map<String, dynamic> json) => ShoppieUser(
        name: json["name"],
        email: json["email"],
        type: json["type"] == "seller" ? UserType.seller : UserType.buyer,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "type": type == UserType.seller ? "seller" : UserType.buyer,
      };
}

enum UserType { seller, buyer }
