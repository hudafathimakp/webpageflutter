import 'package:get/get.dart';

import '../controllers/desktopscreen_controller.dart';

class DesktopscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DesktopscreenController>(
      () => DesktopscreenController(),
    );
  }
}
