import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hollaex/Controllers/main_controller.dart';
import 'package:hollaex/Controllers/orderbook_controller.dart';
import 'package:hollaex/Globals/Constans/numbers.dart';
import 'package:hollaex/Globals/Constans/paths.dart';
import 'package:hollaex/Globals/Constans/strings.dart';
import 'package:hollaex/Globals/Theme/theme.dart';

class TopFilter extends StatelessWidget {
  OrderBookController orderBookController = Get.find();
  MainController mainController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            orderBookTitle,
            style: GoogleFonts.poppins(
              color: getWhiteBlackTextColor(mainController),
              fontSize: middleTitleSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  filterAreaBorderRadiusValue),
              color: getBackgroundColor(mainController),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: filters(),
            ),
          )
        ],
      ),
    );
  }

  Widget unSelectedfilterItem(String iconPath, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: filterAreaHorizontalPadding,
        vertical: filterAreaVerticalPadding,
      ),
      child: GestureDetector(
        onTap: () {
          orderBookController.filterIndex.value = index;
        },
        child: SvgPicture.asset(iconPath),
      ),
    );
  }

  Widget selectedFilterItem(String iconPath, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            filterAreaBorderRadiusValue),
        color: getFilterBgColor(mainController),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: filterAreaHorizontalPadding,
          vertical: filterAreaVerticalPadding,
        ),
        child: GestureDetector(
          onTap: () {
            orderBookController.filterIndex.value = index;
          },
          child: SvgPicture.asset(iconPath),
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
          filterItem(0, justifyIconPath),
          filterItem(1, orderBuyIconPath),
          filterItem(2, orderSellIconPath),
        ],
      ),
    );
  }
}
