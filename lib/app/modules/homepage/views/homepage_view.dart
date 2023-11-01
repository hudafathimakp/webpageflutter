import 'package:flutter/material.dart';
import 'package:flutter_webpage/app/modules/desktopscreen/views/desktopscreen_view.dart';
import 'package:flutter_webpage/app/modules/mobailscreen/views/mobailscreen_view.dart';
import 'package:flutter_webpage/responsive.dart';

import 'package:get/get.dart';

import '../controllers/homepage_controller.dart';

class HomepageView extends GetView<HomepageController> {
  const HomepageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsive(
        mobile: MobailScreen(),
        desktop: DesktopScreen(),
      ),
    );
  }
}
