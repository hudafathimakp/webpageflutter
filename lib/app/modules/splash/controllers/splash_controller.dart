import 'package:flutter_webpage/app/routes/app_pages.dart';
import 'package:flutter_webpage/app/session.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () async {
      loginStatus();
    });
  }

  void loginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString("id");
    String? name = prefs.getString("name");

    if (id != null) {
      Session.userId = id;
      Session.userName = name.toString();
      // final response = await ApiProvider().getProfile(id);
      // if (response != null) {
      //   if (response.status == true) {
      //     // getAssignedRoutes();
      //     // getMarkTypes();

      //     Session.userName = response.data.name.toString();
      //     Session.userMobile = response.data.mobile.toString();

      Get.offAndToNamed(Routes.HOMEPAGE);
    } else {
      Get.toNamed(Routes.LOGINPAGE);
    }
  }
}
