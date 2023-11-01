import 'package:flutter/material.dart';
import 'package:flutter_webpage/common_widget/chat_list.dart';
import 'package:flutter_webpage/common_widget/chat_textfeild.dart';
import 'package:flutter_webpage/common_widget/search_feild.dart';
import 'package:flutter_webpage/common_widget/svg_widget.dart';
import 'package:flutter_webpage/common_widget/text.dart';

import 'package:get/get.dart';

import '../controllers/desktopscreen_controller.dart';

class DesktopScreen extends GetView<DesktopscreenController> {
  const DesktopScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // flex: -6,
        Expanded(
          // flex: -6,
          // constraints: const BoxConstraints(
          //   minWidth: 330,
          //   maxWidth: 300,
          // ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CommonSearchField(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                ),
                Text(
                  "Chats",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      foreground: Paint()..shader = linearGradient),
                ),
                Container(
                  decoration: const BoxDecoration(

                      // gradient: LinearGradient(
                      //   begin: Alignment.centerLeft,
                      //   end: Alignment.centerRight,
                      //   colors: [
                      //     Color(0xFF7E31BA),
                      //     Color(0xFFC417BF),
                      //   ],
                      // ),

                      ),
                  child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: 3,
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemBuilder: (context, index) {
                        return SingleChildScrollView(
                            child: DrawerList(
                          image: "asset/image/profile.png",
                          tittle: "Vysakh",
                          subtittle: "Are you there?",
                          onpress: () {},
                        ));
                      }),
                )
              ],
            ),
          ),
        ),

        Expanded(
          flex: 4,
          child: Column(
            children: [
              const HeaderText(
                name: "Vysakh",
                lastSeen: "Online",
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 20),
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
                              itemCount: controller.massege.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: ChatText(
                                    time: ' 10.00',
                                    type: index % 2 == 0
                                        ? controller.type.value
                                        : 'Type',
                                    massage: controller.massege[index],
                                  ),
                                );
                              }),
                        )
                      ]),
                ),
              ),
              const ChatType()
            ],
          ),
        ),
      ],
    );
  }
}

class TodayText extends StatelessWidget {
  final String label;
  const TodayText({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black,
      ),
      child: whiteText(label, 12),
    );
  }
}

class ChatType extends StatelessWidget {
  const ChatType({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 290,
            child: TextChatFeild(
              hintText: 'Type your message here',
              suffixIcon: IconButton(
                onPressed: () {},
                icon: svgWidget("asset/svg/sent.svg", color: Colors.black),
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
                  onPressed: () {}, icon: svgWidget("asset/svg/mic.svg"))),
        ],
      ),
    );
  }
}

class HeaderText extends StatelessWidget {
  final String name, lastSeen;
  const HeaderText({
    super.key,
    required this.name,
    required this.lastSeen,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          child: Image.asset("asset/image/profile.png", fit: BoxFit.fill),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            blackText(name, 16, fontWeight: FontWeight.w600),
            Text(
              lastSeen,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  foreground: Paint()..shader = linearGradient),
            ),
          ],
        )
      ],
    );
  }
}

class ChatText extends StatelessWidget {
  final String type, time, massage;
  const ChatText({
    super.key,
    required this.type,
    required this.time,
    required this.massage,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: type == "user" ? Alignment.bottomRight : Alignment.bottomLeft,
      child: Column(
        crossAxisAlignment:
            type == "user" ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            time,
            style: const TextStyle(color: Color(0xffA03ECF), fontSize: 8),
          ),
          Container(
            // margin: const EdgeInsets.symmetric(
            //     horizontal: 64),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: type == "user" ? const Color(0xff8B2CBA) : Colors.white,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
            ),
            child: Text(
              massage,
              style: TextStyle(
                color: type == "user" ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final Shader linearGradient = const LinearGradient(
  colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
