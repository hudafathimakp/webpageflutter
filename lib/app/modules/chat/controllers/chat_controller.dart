import 'package:flutter_webpage/app/api/api.dart';
import 'package:flutter_webpage/app/model/user_response.dart';
import 'package:flutter_webpage/app/session.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatController extends GetxController {

  var isLoading = false.obs;
  RxList<UserModel> userList = <UserModel>[].obs;
   late IO.Socket socket;

  @override
  void onInit() {
    connect();
    userLists();
    super.onInit();
  }

  void connect() {
    socket = IO.io('http://192.168.29.248:5000/', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });
    socket.connect();
    socket.emit("signin", Session.userId);
    socket.onConnect((data) {
      print("Connected");
      socket.on("message", (msg) {
        // receiveMessage( msg["message"]);
        // scrollController.animateTo(scrollController.position.maxScrollExtent,
            // duration: Duration(milliseconds: 300), curve: Curves.easeOut);
      });
    });
  }

  // void connect(int sourchatId) {
  //   socket = IO.io("http://192.168.29.248:5000/", <String, dynamic>{
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

}
