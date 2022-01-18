import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollaex/Globals/Constans/numbers.dart';
import 'package:hollaex/Globals/Constans/payloads.dart';
import 'package:hollaex/Globals/Constans/strings.dart';
import 'package:hollaex/Globals/Constans/urls.dart';
import 'package:hollaex/Models/orderbook_model.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class OrderBookController extends GetxController {
  IOWebSocketChannel hollaExChannel;

  TextEditingController controller = TextEditingController();

  RxInt filterIndex = 0.obs;

  OrderBookModel orderBook;
  
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
    print(sendPingWarning);
  }

  void keepConnectionAlive() {
    Future.delayed(Duration(seconds: pingDuration)).then((value) {
      sendPing();
      keepConnectionAlive();
    });
  }

  void modelData(AsyncSnapshot snapshot) {
    Map tmp = json.decode(snapshot.data);
    orderBook = OrderBookModel.fromJson(tmp);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    hollaExChannel.sink.close();
    controller.dispose();
  }
}
