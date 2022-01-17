import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollaex/Globals/Constans/urls.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class OrderBookController extends GetxController {
  IOWebSocketChannel hollaExChannel;
  TextEditingController controller = TextEditingController();
  RxInt filterIndex = 0.obs;
  var orderBook;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    hollaExChannel = WebSocketChannel.connect(
      Uri.parse(urlStreamChannel),
    );
    hollaExChannel.sink.add(orderBookPayload);
    keepConnectionAlive();
  }

  void sendPing() {
    hollaExChannel.sink.add(pingPayload);
    print('ping sended');
  }

  void keepConnectionAlive() {
    Future.delayed(const Duration(seconds: 30)).then((value) {
      sendPing();
      keepConnectionAlive();
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    hollaExChannel.sink.close();
    controller.dispose();
  }
}
