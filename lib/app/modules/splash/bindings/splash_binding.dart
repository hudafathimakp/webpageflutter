import 'package:flutter_webpage/app/modules/chat/controllers/chat_controller.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
      Get.lazyPut<ChatController>(
      () => ChatController(),
    );
  }
}
