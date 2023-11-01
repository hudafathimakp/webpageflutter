import 'package:flutter/material.dart';
import 'package:flutter_webpage/app/modules/chat/views/chat_view.dart';
import 'package:flutter_webpage/common_widget/text.dart';

import 'package:get/get.dart';

import '../controllers/mobailscreen_controller.dart';

class MobailScreen extends GetView<MobailscreenController> {
  const MobailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            TabBar(
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              labelColor: const Color(0xffAD69E4),
              unselectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.w400),
              unselectedLabelColor: Colors.black,
              onTap: (int index) {
                if (index == 0) {
                } else {}
              },
              tabs: const [
                Tab(
                  text: "Chats",
                ),
                Tab(
                  text: "Updates",
                ),
                Tab(
                  text: "Calls",
                ),
              ],
            ),
            const Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  ChatView(),
                  ChatView(),
                  ChatView(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.logOut();
        },
        child: Container(
          height: 60,
          width: 60,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.purple),
          child: const Icon(
            Icons.logout_outlined,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

Future<dynamic> openDialog(
  String title,
  String subTitle,
) {
  return Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        titlePadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  // size: 20,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: blackText(title, 20, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: blackText(subTitle, 17),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    side:
                                        const BorderSide(color: Colors.grey)))),
                        onPressed: () {
                          Get.back(result: false);
                        },
                        child: blackText('Cancel', 17)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    side: const BorderSide(
                                        color: Colors.purple)))),
                        onPressed: () {
                          Get.back(result: true);
                        },
                        child: const Text(
                          'Ok',
                          style: TextStyle(
                              fontFamily: "Manrope",
                              color: Colors.purple,
                              fontSize: 17),
                        )),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      barrierDismissible: false);
}
