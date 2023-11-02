import 'package:flutter/material.dart';
import 'package:flutter_webpage/app/modules/chat/controllers/chat_controller.dart';
import 'package:get/get.dart';

// import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatDetailsController extends GetxController {
  final RxString type = ''.obs;
  // var isLoading = false.obs;
  // RxList<UserModel> userList = <UserModel>[].obs;

  // io.Socket? socket;

  final socketService = Get.find<ChatController>();
  RxList<String> messages = <String>[].obs;
  TextEditingController messageController = TextEditingController();
  final messageList = ['hey', 'hello', 'how are you?', 'good'];
  final argumet = Get.arguments;

  @override
  void onInit() {
    socketService.socket.on('message', (msg) {
      receiveMessage(msg["message"]);
    });
    usertype();
    super.onInit();
  }

  usertype() {
    type.value = 'user';
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

  // void connect(int sourchatId) {
  //   socket = IO.io("http://192.168.29.248:9001/", <String, dynamic>{
  //     "transports": ["websocket"],
  //     "autoConnect": false,
  //   });
  //   socket.connect();
  //   socket.emit("signin", sourchatId);
  //   socket.onConnect((data) {
  //     print("Connected");
  //     socket.on("message", (msg) {
  //       setMessage("destination", msg["message"]);
  //       scrollController.animateTo(scrollController.position.maxScrollExtent,
  //           duration: Duration(milliseconds: 300), curve: Curves.easeOut);
  //     });
  //   });
  //    update();
  //   print(" isconnect " + socket.connected.toString());
  // }

  // @override
  // void onClose() {
  //   // socket?.dispose();
  //   socketService.socket?.off('chat');
  //   super.onClose();
  // }

  // void userLists() async {
  //   isLoading(true);
  //   try {
  //     final response = await ApiProvider().userLists(id: Session.userId);
  //     if (response != null) {
  //       if (response.isNotEmpty) {
  //         isLoading(false);
  //         userList.addAll(response);
  //       } else {
  //         isLoading(false);
  //       }
  //     }
  //   } finally {
  //     isLoading(false);
  //   }
  // }

//  void setMessage(String type, msg) {
//     MessageModel messageModel = MessageModel(
//         type: type,
//         message: msg,
//         time: DateTime.now().toString().substring(10, 16));
//     messages.add(messageModel);
//     update();
//   }

  void sendMessage(String message, sourceId, targetId) {
    if (message.isNotEmpty) {
      messages.add(message);
      socketService.socket.emit('message',
          {"message": message, "sourceId": sourceId, "targetId": targetId});
      messageController.clear();
    }
  }

  void receiveMessage(String message) {
    messages.add("Other: $message");
  }

  @override
  void onClose() {
    socketService.socket.off('message');
    super.onClose();
  }
}
