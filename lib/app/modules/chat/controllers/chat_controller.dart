
import 'package:flutter/material.dart';
import 'package:flutter_webpage/app/api/api.dart';
import 'package:flutter_webpage/app/model/user_response.dart';
import 'package:flutter_webpage/app/session.dart';
import 'package:get/get.dart';

// import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatController extends GetxController {
  final contacts = ['Vaisak', 'Anusha', 'Hafeed', 'Avani'];
  final RxString type = ''.obs;
  var isLoading = false.obs;
  RxList<UserModel> userList = <UserModel>[].obs;
  late IO.Socket socket;
  // io.Socket? socket;

  //  final socketService = Get.find<SocketService>();
  RxList<String> messages = <String>[].obs;
  TextEditingController messageController = TextEditingController();
  final messageList = ['hey', 'hello', 'how are you?', 'good'];

  @override
  void onInit() {
    connect();
    socket.on('chat', (data) {
      receiveMessage(data);
    });

    usertype();
    userLists();
    super.onInit();
  }

  usertype() {
    type.value = 'user';
  }

  void connect() {
    socket = IO.io('http://192.168.29.248:5000/', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });
    socket.connect();
    // socket.emit(
    //   "signin","hi Huda"
    // );
    socket.onConnect((data) => print("connected"));
  }

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

  void userLists() async {
    isLoading(true);
    try {
      final response = await ApiProvider().userLists(id: Session.userId);
      if (response != null) {
        if (response.isNotEmpty) {
          isLoading(false);

          userList.addAll(response);
        } else {
          isLoading(false);
        }
      }
    } finally {
      isLoading(false);
    }
  }

  void sendMessage(String message) {
    if (message.isNotEmpty) {
      messages.add(message);
      socket.emit('message', message);
      messageController.clear();
    }
  }

  void receiveMessage(String message) {
    messages.add("Other: $message");
  }
}
