// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// import '../controllers/splash_controller.dart';

// class SplashView extends GetView<SplashController> {
//   const SplashView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('SplashView'),
//         centerTitle: true,
//       ),
//       body: const Center(
//         child: Text(
//           'SplashView is working',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_webpage/app/session.dart';

import 'package:flutter_webpage/common_widget/text.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(color: Colors.purple),
          child: Center(
              child: whiteText("Welcome ${Session.userName}", 50,
                  textAlign: TextAlign.center, fontWeight: FontWeight.w800))),

      //     Image.asset(
      //   'assets/image/splash_impex.png',
      //   fit: BoxFit.fill,
      //   width: double.infinity,
      //   height: double.infinity,
      // )
    );
  }
}
