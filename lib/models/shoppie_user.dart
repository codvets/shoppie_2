class ShoppieUser {
  ShoppieUser({
    required this.name,
    required this.email,
    required this.type,
    required this.uid,
  });

  String name;
  String email;
  UserType type;
  String uid;

  factory ShoppieUser.fromJson(Map<String, dynamic> json, String uid) =>
      ShoppieUser(
        name: json["name"],
        uid: uid,
        email: json["email"],
        type: json["type"] == "seller" ? UserType.seller : UserType.buyer,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "uid": uid,
        "email": email,
        "type": type == UserType.seller ? "seller" : UserType.buyer,
      };
}

enum UserType { seller, buyer }
