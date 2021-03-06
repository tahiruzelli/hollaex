import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollaex/Controllers/main_controller.dart';
import 'package:hollaex/Controllers/orderbook_controller.dart';
import 'package:hollaex/Globals/Constans/numbers.dart';
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
    mainController.reloadState();
    return Obx(
      () => Scaffold(
        backgroundColor: getBackgroundColor(mainController),
        appBar: buildAppBar(mainController),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: pageHorizontalPadding,
            vertical: pageVerticalPadding,
          ),
          child: Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: getCardColor(mainController),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: pageHorizontalPadding,
                vertical: pageVerticalPadding,
              ),
              child: Column(
                children: [
                  TopFilter(),
                  SizedBox(height: pageHorizontalPadding),
                  StreamBuilder(
                    stream: orderBookController.hollaExChannel.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data == pongMessage ||
                            snapshot.data == welcomeMessage) {
                          return getPages();
                        } else {
                          orderBookController.modelData(snapshot);
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
    if (orderBookController.orderBook == null) {
      return Container();
    } else {
      return Obx(() {
        if (orderBookController.filterIndex.value == 0) {
          return BidsAsksView();
        } else if (orderBookController.filterIndex.value == 1) {
          return AsksView();
        } else if (orderBookController.filterIndex.value == 2) {
          return BidsView();
        } else {
          warningSnackBar(errorTitle, restartAppMessage);
          return Container();
        }
      });
    }
  }
}
