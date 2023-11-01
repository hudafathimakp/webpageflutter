import 'package:get/get.dart';

class DesktopscreenController extends GetxController {
  final RxString type = ''.obs;
  final massege = ['hey','hello','how are you?','good'];
  @override
  void onInit() {
    usertype();
    super.onInit();
  }

  usertype() {
    type.value = 'user';
  }
}
