
import 'package:flutter_webpage/app/modules/chat/controllers/chat_details_controller.dart';
import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(
      () => ChatController(),
    );
        Get.lazyPut<ChatDetailsController>(
      () => ChatDetailsController(),
    );
  }
}
