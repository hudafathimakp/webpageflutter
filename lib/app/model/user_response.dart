// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
    int id;
    String name;
    String img;
    String mobile;
    String password;
    int status;

    UserModel({
        required this.id,
        required this.name,
        required this.img,
        required this.mobile,
        required this.password,
        required this.status,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        img: json["img"],
        mobile: json["mobile"],
        password: json["password"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "img": img,
        "mobile": mobile,
        "password": password,
        "status": status,
    };
}
