import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollaex/Controllers/main_controller.dart';
import 'package:hollaex/Controllers/orderbook_controller.dart';
import 'package:hollaex/Globals/Constans/colors.dart';
import 'package:hollaex/Globals/Constans/strings.dart';
import 'package:hollaex/Globals/Theme/theme.dart';
import 'package:hollaex/Globals/Widgets/my_appbar.dart';
import 'package:hollaex/Globals/Widgets/my_snackbar.dart';
import 'package:hollaex/Views/OrderBooks/Pages/asks_view.dart';
import 'package:hollaex/Views/OrderBooks/Pages/bids_asks_view.dart';
import 'package:hollaex/Views/OrderBooks/Widgets/top_filter.dart';
import 'Pages/bids_view.dart';

class OrderBooksView extends StatelessWidget {
  OrderBookController orderBookController = Get.put(OrderBookController());
  MainController mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: getBackgroundColor(),
        appBar: buildAppBar(mainController),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
          child: Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: getCardColor(),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
              child: Column(
                children: [
                  TopFilter(),
                  StreamBuilder(
                    stream: orderBookController.hollaExChannel.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data == pongMessage ||
                            snapshot.data == welcomeMessage) {
                          return getPages();
                        } else {
                          Map tmp = json.decode(snapshot.data);
                          orderBookController.orderBook = tmp;
                          return getPages();
                        }
                      } else {
                        return Container();
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getPages() {
    return Obx(() {
      if (orderBookController.filterIndex.value == 0) {
        return BidsAsksView();
      } else if (orderBookController.filterIndex.value == 1) {
        return AsksView();
      } else if (orderBookController.filterIndex.value == 2) {
        return BidsView();
      } else {
        warningSnackBar('Error', 'Something is wrong. Please restart the app');
        return Container();
      }
    });
  }
}
