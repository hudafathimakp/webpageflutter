import 'package:flutter/material.dart';
import 'package:flutter_webpage/app/constants/login_constant.dart';
import 'package:flutter_webpage/app/routes/app_pages.dart';
import 'package:flutter_webpage/common_widget/login_textfeild.dart';
import 'package:flutter_webpage/common_widget/text.dart';
import 'package:flutter_webpage/responsive.dart';
import 'package:get/get.dart';
import '../controllers/loginpage_controller.dart';

class LoginpageView extends GetView<LoginpageController> {
  const LoginpageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKey,
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        constraints:
                            const BoxConstraints(maxWidth: 500, minWidth: 100),
                        // height: 550,
                        // width: 700,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFF7EBFF)),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome back",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                    foreground: Paint()
                                      ..shader = linearGradient),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              blackText("Log in to your account", 36,
                                  fontWeight: FontWeight.w800),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: LoginFeild(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Enter Your Mobile number';
                                    }
                                    return null;
                                  },
                                  textEditingController:
                                      controller.userNameController,
                                  hintText: "Mobile Number",
                                  obscureText: false,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: LoginFeild(
                                  textEditingController:
                                      controller.passWordController,
                                  hintText: "PassWord",
                                  obscureText: false,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Enter Your Password';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Center(
                                  child: 
                                  Obx(() => Responsive(

                                mobile: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50),
                                  child: 
                                  GradientButton(
                                    isLoading: controller.isLoading.value,
                                    onClick: () {
                                      FocusScope.of(context).unfocus();
                                      if (controller.formKey.currentState!
                                          .validate()) {
                                        controller.login();
                                      }
                                    },
                                    //     onClick: () {
                                    //     Get.toNamed(Routes.HOMEPAGE);
                                    // },
                                  ),
                                ),
                                desktop: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 80),
                                  child: GradientButton(
                                    onClick: () {
                                      Get.toNamed(Routes.HOMEPAGE);
                                    },
                                  ),
                                ),
                              ))),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
