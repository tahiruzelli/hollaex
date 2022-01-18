import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hollaex/Controllers/orderbook_controller.dart';
import 'package:hollaex/Globals/Constans/colors.dart';
import 'package:hollaex/Globals/Constans/numbers.dart';
import 'package:hollaex/Globals/Constans/strings.dart';
import 'package:hollaex/Globals/Theme/theme.dart';

class BidsView extends StatelessWidget {
  OrderBookController orderBookController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          orderBookController.filterIndex.value = 2;
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
                    xhtPrice,
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
                    itemCount: orderBookController.orderBook.data.bids.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            orderBookController.orderBook.data.bids[index].price
                                .toString(),
                            style: GoogleFonts.poppins(
                              color: colorRed,
                            ),
                          ),
                          Text(
                            orderBookController.orderBook.data.bids[index].piece
                                .toString(),
                            style: GoogleFonts.poppins(
                              color: getWhiteBlackTextColor(),
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
