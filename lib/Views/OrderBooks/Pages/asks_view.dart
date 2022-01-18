import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hollaex/Controllers/main_controller.dart';
import 'package:hollaex/Controllers/orderbook_controller.dart';
import 'package:hollaex/Globals/Constans/colors.dart';
import 'package:hollaex/Globals/Constans/numbers.dart';
import 'package:hollaex/Globals/Constans/strings.dart';
import 'package:hollaex/Globals/Theme/theme.dart';

class AsksView extends StatelessWidget {
  OrderBookController orderBookController = Get.find();
  MainController mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (orderBookController.filterIndex.value == 1) {
            orderBookController.filterIndex.value = 0;
          } else {
            orderBookController.filterIndex.value = 1;
          }
        },
        child: SizedBox(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    xhtPrice,
                    style: GoogleFonts.poppins(
                      color: colorGrey,
                      fontSize: middleTitleSize,
                    ),
                  ),
                  Text(
                    xhtAmount,
                    style: GoogleFonts.poppins(
                      color: colorGrey,
                      fontSize: middleTitleSize,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SizedBox(
                  child: ListView.builder(
                    itemCount: orderBookController.orderBook.data.asks.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            orderBookController.orderBook.data.asks[index].price
                                .toString(),
                            style: GoogleFonts.poppins(
                              color: colorGreen,
                            ),
                          ),
                          Text(
                            orderBookController.orderBook.data.asks[index].piece
                                .toString(),
                            style: GoogleFonts.poppins(
                              color: getWhiteBlackTextColor(mainController),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
