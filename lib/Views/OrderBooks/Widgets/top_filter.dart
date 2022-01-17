import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hollaex/Controllers/main_controller.dart';
import 'package:hollaex/Controllers/orderbook_controller.dart';
import 'package:hollaex/Globals/Constans/colors.dart';
import 'package:hollaex/Globals/Theme/theme.dart';

class TopFilter extends StatelessWidget {
  OrderBookController orderBookController = Get.find();
  MainController mainController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(
          () => Text(
            'Order Book',
            style: GoogleFonts.poppins(
              color: getWhiteBlackTextColor(),
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: colorBlack,
          ),
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: filters(),
          ),
        )
      ],
    );
  }

  Widget unSelectedfilterItem(String iconPath, int index) {
    return GestureDetector(
      onTap: () {
        orderBookController.filterIndex.value = index;
      },
      child: SvgPicture.asset('assets/icons/$iconPath'),
    );
  }

  Widget selectedFilterItem(String iconPath, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: colorGrey,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
        child: GestureDetector(
          onTap: () {
            orderBookController.filterIndex.value = index;
          },
          child: SvgPicture.asset('assets/icons/$iconPath'),
        ),
      ),
    );
  }

  Widget filterItem(int index, String iconPath) {
    if (index == orderBookController.filterIndex.value) {
      return selectedFilterItem(iconPath, index);
    } else {
      return unSelectedfilterItem(iconPath, index);
    }
  }

  Widget filters() {
    return Obx(
      () => Row(
        children: [
          const SizedBox(width: 5),
          filterItem(0, 'justify.svg'),
          const SizedBox(width: 10),
          filterItem(1, 'orderbuy.svg'),
          const SizedBox(width: 10),
          filterItem(2, 'ordersell.svg'),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
