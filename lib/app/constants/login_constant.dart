import 'package:flutter/material.dart';
import 'package:flutter_webpage/app/routes/app_pages.dart';
import 'package:flutter_webpage/common_widget/login_textfeild.dart';
import 'package:flutter_webpage/common_widget/text.dart';
import 'package:flutter_webpage/responsive.dart';
import 'package:get/get.dart';

class LoginConstant extends StatelessWidget {
  const LoginConstant({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500, minWidth: 100),
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
                        foreground: Paint()..shader = linearGradient),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  blackText("Log in to your account", 36,
                      fontWeight: FontWeight.w800),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: LoginFeild(
                      hintText: "Mobile Number",
                      obscureText: false,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: LoginFeild(
                      hintText: "PassWord",
                      obscureText: true,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                      child: Responsive(
                    mobile: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: GradientButton(
                        onClick: () {
                          Get.toNamed(Routes.HOMEPAGE);
                        },
                      ),
                    ),
                    desktop: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: GradientButton(
                        onClick: () {
                          Get.toNamed(Routes.HOMEPAGE);
                        },
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class GradientButton extends StatelessWidget {
  final VoidCallback onClick;
  final bool? isLoading;
  const GradientButton({
    super.key,
    required this.onClick,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) =>
        //           const HomepageView()),
        // );
      },
      child: Container(
          // width: 160,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFF7E31BA),
                Color(0xFFC417BF),
              ],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: isLoading == true
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Center(
                  child: whiteText("Log in", 16, fontWeight: FontWeight.w700))),
    );
  }
}

final Shader linearGradient = const LinearGradient(
  colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
