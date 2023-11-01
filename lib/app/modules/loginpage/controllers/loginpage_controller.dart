import 'package:flutter/material.dart';
import 'package:flutter_webpage/app/api/api.dart';
import 'package:flutter_webpage/app/routes/app_pages.dart';
import 'package:flutter_webpage/app/session.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginpageController extends GetxController {
  TextEditingController userNameController = TextEditingController(text: '');
  TextEditingController passWordController = TextEditingController(text: "");
  final formKey = GlobalKey<FormState>();
  var isLoading = false.obs;
  final isObscureText = true.obs;

  void login() async {
    isLoading(true);
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? id = prefs.getString("id");
    // if (id != null) {
    //   Session.userId = id;

    try {
      final response = await ApiProvider().login(
          username: userNameController.text.trim(),
          password: passWordController.text.trim());
      if (response != null) {
        if (response.status == 0) {
          isLoading(false);
          final prefs = await SharedPreferences.getInstance();
          prefs.setString('id', response.id.toString());
          prefs.setString('name', response.name.toString());
          // prefs.setString('name', response.data.first.name.toString());
          Session.userName = response.name;
          Get.offAllNamed(Routes.SPLASH);
        } else {
          isLoading(false);
        }
      }
    } finally {
      isLoading(false);
    }
  }

  // void visibles() {
  //   visible.value == false ? true : false;
  // }
}
