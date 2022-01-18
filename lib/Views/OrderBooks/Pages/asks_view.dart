import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hollaex/Controllers/orderbook_controller.dart';
import 'package:hollaex/Globals/Constans/colors.dart';
import 'package:hollaex/Globals/Theme/theme.dart';

class AsksView extends StatelessWidget {
  OrderBookController orderBookController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: (){
          orderBookController.filterIndex.value = 1;
        },
        child: SizedBox(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'XHT Price',
                    style: GoogleFonts.poppins(
                      color: colorGrey,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    'XHT Amount',
                    style: GoogleFonts.poppins(
                      color: colorGrey,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SizedBox(
                  child: ListView.builder(
                    itemCount:
                        orderBookController.orderBook['data']['asks'].length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            orderBookController.orderBook['data']['asks'][index]
                                    [0]
                                .toString(),
                            style: GoogleFonts.poppins(
                              color: colorGreen,
                            ),
                          ),
                          Text(
                            orderBookController.orderBook['data']['asks'][index]
                                    [1]
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
