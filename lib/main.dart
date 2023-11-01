import 'package:flutter/material.dart';
import 'package:flutter_webpage/app/routes/app_pages.dart';
import 'package:get/get.dart';

void main() {
    // Get.put(SocketService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Flutter Web",
      // initialBinding: InitBinding(),
      initialRoute: AppPages.INITIAL,
      defaultTransition: Transition.noTransition,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

          ),
    );
  }
}
