import 'package:flutter_webpage/app/modules/mobailscreen/views/mobailscreen_view.dart';
import 'package:flutter_webpage/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MobailscreenController extends GetxController {


  final count = 0.obs;

  void logOut() async {
    dynamic returnResponse =
        await openDialog('Logout', 'Are you sure you want to Logout ?');
    if (returnResponse == true) {
      final prefs = await SharedPreferences.getInstance();
      prefs.clear();

      Get.offAllNamed(Routes.SPLASH);
    }
  }
}
