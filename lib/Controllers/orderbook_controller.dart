import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class OrderBookController extends GetxController {
  IOWebSocketChannel hollaExChannel;
  TextEditingController controller = TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    hollaExChannel = WebSocketChannel.connect(
      Uri.parse('wss://api.hollaex.com/stream'),
    );
    hollaExChannel.sink.add('{"op": "subscribe","args": ["orderbook:xht-usdt"]}');
  }

  void sendMessage() {
    if (controller.text.isNotEmpty) {
      hollaExChannel.sink.add(controller.text);
    }
  }

  @override
  void dispose() {
    hollaExChannel.sink.close();
    controller.dispose();
    super.dispose();
  }
}
