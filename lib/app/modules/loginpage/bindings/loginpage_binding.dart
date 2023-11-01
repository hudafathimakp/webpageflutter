import 'package:flutter_webpage/app/modules/chat/controllers/chat_controller.dart';
import 'package:get/get.dart';

import '../controllers/loginpage_controller.dart';

class LoginpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginpageController>(
      () => LoginpageController(),
    );
    Get.lazyPut<ChatController>(
      () => ChatController(),
    );
  }
}
