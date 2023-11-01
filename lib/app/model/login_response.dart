// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

List<LoginModel> loginModelFromJson(String str) => List<LoginModel>.from(json.decode(str).map((x) => LoginModel.fromJson(x)));

String loginModelToJson(List<LoginModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LoginModel {
    int id;
    String name;
    String img;
    String mobile;
    String password;
    int status;

    LoginModel({
        required this.id,
        required this.name,
        required this.img,
        required this.mobile,
        required this.password,
        required this.status,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
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
