import 'package:flutter/material.dart';

import 'package:flutter_webpage/app/modules/chat/controllers/chat_details_controller.dart';
import 'package:flutter_webpage/app/modules/desktopscreen/views/desktopscreen_view.dart';
import 'package:flutter_webpage/app/session.dart';
import 'package:flutter_webpage/common_widget/chat_textfeild.dart';
import 'package:flutter_webpage/common_widget/svg_widget.dart';

import 'package:get/get.dart';
// import 'package:socket_io_client/socket_io_client.dart' ;

import '../../../../responsive.dart';

class ChatDetails extends GetView<ChatDetailsController> {
  ChatDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        desktop: const DesktopScreen(),
        mobile: Obx(
          () => Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: HeaderText(
                  name: controller.argumet.name,
                  lastSeen: "Online",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    // child: child,

                    decoration: const BoxDecoration(
                      border: Border(top: BorderSide(color: Color(0xFFD0D0D0))),
                      color: Color(0xffF4F4F4),
                      // borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TodayText(
                          label: "Today",
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ChatText(
                                    type: controller.messages[index].type ==
                                            "sender"
                                        ? 'user'
                                        : 'reciver',
                                    time: controller.messages[index].time!,
                                    massage:
                                        controller.messages[index].message!),
                              );
                            },
                            itemCount: controller.messages.length,
                          ),
                        ),
                      ],
                    )),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Row(
                  children: [
                    SizedBox(
                      width: 290,
                      child: TextChatFeild(
                        textEditingController: controller.messageController,
                        hintText: 'Type your message here',
                        suffixIcon: IconButton(
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              controller.sendMessage(
                                  controller.messageController.text,
                                  Session.userId.toString(),
                                  controller.argumet.id);
                            },
                            icon: const Icon(
                              Icons.send,
                              color: Colors.black,
                            )
                            // svgWidget("asset/svg/sent.svg",
                            //     color: Colors.black),
                            ),
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: svgWidget("asset/svg/attach.svg"),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                        height: 45,
                        width: 45,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xFF7E31BA),
                                Color(0xFFC417BF),
                              ],
                            ),
                            shape: BoxShape.circle),
                        child: IconButton(
                            onPressed: () {},
                            icon: svgWidget("asset/svg/mic.svg"))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
