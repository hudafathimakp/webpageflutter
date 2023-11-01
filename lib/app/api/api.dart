

import 'package:flutter_webpage/app/api/http_connect.dart';
import 'package:flutter_webpage/app/model/login_response.dart';
import 'package:flutter_webpage/app/model/user_response.dart';

class ApiProvider {
  Future<LoginModel?> login({
    String? username,
    String? password,
  }) async {
    var add = {
      "mobile": username,
      "password": password,
    };
    var response = await HttpApiConnect().post("login", add);
    try {
      if (response.statusCode == 200) {
        var data = response.body;
        return loginModelFromJson(data.toString()).first;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future <List<UserModel>?> userLists({
    String? id,
  }) async {
    var add = {
      "id": id,
    };
    var response = await HttpApiConnect().post("users", add);
    try {
      if (response.statusCode == 200) {
        var data = response.body;
        // return UserModel.fromJson(json.decode(data));
        return userModelFromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
