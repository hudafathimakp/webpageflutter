import 'package:flutter/material.dart';
import 'package:flutter_webpage/app/model/chat_model.dart';
import 'package:flutter_webpage/app/modules/chat/controllers/chat_controller.dart';
import 'package:get/get.dart';

class ChatDetailsController extends GetxController {
  final RxString type = ''.obs;
  RxList<MessageModel> messages = RxList<MessageModel>();
  final socketService = Get.find<ChatController>();
  // RxList<String> messages = <String>[].obs;

 DateTime currentDate = DateTime.now();
  TextEditingController messageController = TextEditingController();
  final argumet = Get.arguments;

  @override
  void onInit() {
    socketService.socket.on('message', (msg) {
      setMessage("receiver", msg["message"]);
      // receiveMessage(msg["message"]);
    });

    super.onInit();
  }

  // void connect() {
  //   socket = IO.io('http://192.168.29.248:5000/', <String, dynamic>{
  //     'transports': ['websocket'],
  //     'autoConnect': true,
  //   });
  //   socket.connect();
  //   socket.emit("signin", Session.userId);
  //   socket.onConnect((data) {
  //     print("Connected");
  //     socket.on("message", (msg) {
  //       receiveMessage(msg["message"]);
  //       // scrollController.animateTo(scrollController.position.maxScrollExtent,
  //       // duration: Duration(milliseconds: 300), curve: Curves.easeOut);
  //     });
  //   });
  // }

  void setMessage(String type, msg) {
    MessageModel messageModel = MessageModel(
        type: type,
        message: msg,
        time: DateTime.now().toString().substring(10, 16));
    messages.add(messageModel);
    update();
  }

  void sendMessage(String message, sourceId, targetId,) {
    if (message.isNotEmpty) {
      setMessage("sender", message);
      // messages.add(message);
      socketService.socket.emit('message',
          {"message": message, "sourceId": sourceId, "targetId": targetId});
      messageController.clear();
    }
  }

  // void receiveMessage(String message) {
  //   messages.add("Other: $message",);
  // }

  // @override
  // void onClose() {
  //   socketService.socket.off('message');
  //   super.onClose();
  // }
}
