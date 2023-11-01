import 'package:flutter_webpage/app/modules/desktopscreen/controllers/desktopscreen_controller.dart';
import 'package:flutter_webpage/app/modules/mobailscreen/controllers/mobailscreen_controller.dart';

import 'package:get/get.dart';

import '../controllers/homepage_controller.dart';

class HomepageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomepageController>(
      () => HomepageController(),
    );
    Get.lazyPut<DesktopscreenController>(
      () => DesktopscreenController(),
    );
    Get.lazyPut<MobailscreenController>(
      () => MobailscreenController(),
    );
    
  }
}
