import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.uid,
    required this.username,
    required this.password,
    required this.email,
  });

  String? uid;
  String? username;
  String? password;
  String? email;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json["uid"] ?? "",
        username: json["username"] ?? "",
        password: json["password"] ?? "",
        email: json["email"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "uid": uid!,
        "username": username!,
        "password": password!,
        "email": email!,
      };
}
