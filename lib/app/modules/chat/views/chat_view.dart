import 'package:flutter/material.dart';
import 'package:flutter_webpage/app/routes/app_pages.dart';
import 'package:flutter_webpage/common_widget/chat_list.dart';
import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => (controller.isLoading.value)
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.separated(
            separatorBuilder: (BuildContext ctx, index) {
              return const Divider(
                height: 1,
              );
            },
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: controller.userList.length,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DrawerList(
                  image: controller.userList[index].img,
                  tittle: controller.userList[index].name,
                  subtittle: controller.userList[index].mobile,
                  onpress: () {
                    Get.toNamed(Routes.CHATDETAILS,arguments:controller.userList[index] );
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const ChatDetails()),
                    // );
                  },
                ),
              ));
            }));
  }
}
