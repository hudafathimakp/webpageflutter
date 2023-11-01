import 'package:get/get.dart';

import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_details.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/desktopscreen/bindings/desktopscreen_binding.dart';
import '../modules/desktopscreen/views/desktopscreen_view.dart';
import '../modules/homepage/bindings/homepage_binding.dart';
import '../modules/homepage/views/homepage_view.dart';
import '../modules/loginpage/bindings/loginpage_binding.dart';
import '../modules/loginpage/views/loginpage_view.dart';
import '../modules/mobailscreen/bindings/mobailscreen_binding.dart';
import '../modules/mobailscreen/views/mobailscreen_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOMEPAGE,
      page: () => const HomepageView(),
      binding: HomepageBinding(),
    ),
    GetPage(
      name: _Paths.LOGINPAGE,
      page: () => const LoginpageView(),
      binding: LoginpageBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => const ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.CHATDETAILS,
      page: () => ChatDetails(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.DESKTOPSCREEN,
      page: () => const DesktopScreen(),
      binding: DesktopscreenBinding(),
    ),
    GetPage(
      name: _Paths.MOBAILSCREEN,
      page: () => const MobailScreen(),
      binding: MobailscreenBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
