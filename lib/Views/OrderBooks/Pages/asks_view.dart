import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollaex/Controllers/orderbook_controller.dart';

class AsksView extends StatelessWidget {
  OrderBookController orderBookController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: ListView.builder(
          itemCount: orderBookController.orderBook['data']['asks'].length,
          itemBuilder: (context, index) {
            return Text(
              orderBookController.orderBook['data']['asks'][index][0].toString(),
            );
          },
        ),
      ),
    );
  }
}
