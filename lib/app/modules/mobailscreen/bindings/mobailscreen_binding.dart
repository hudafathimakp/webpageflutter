import 'package:get/get.dart';

import '../controllers/mobailscreen_controller.dart';

class MobailscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MobailscreenController>(
      () => MobailscreenController(),
    );
  }
}
