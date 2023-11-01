// import 'package:flutter_webpage/app/api/baseurl.dart';
// import 'package:get/get.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

// class SocketService extends GetxService {
//   late IO.Socket socket;

//   void connect() {
//     socket = IO.io('http://192.168.29.248:5000/', <String, dynamic>{
//       'transports': ['websocket'],
//       'autoConnect': true,
//     });
//     socket.connect();
//     socket.onConnect((data) => print("connected"));
//   }

//   @override
//   void onInit() {
//     connect();
//     super.onInit();
//   }

//   // @override
//   // void onClose() {
//   //   socket.dispose();
//   //   super.onClose();
//   // }
// }
