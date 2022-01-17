import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hollaex/Controllers/orderbook_controller.dart';
import 'package:hollaex/Globals/Constans/colors.dart';

class TopFilter extends StatelessWidget {
  OrderBookController orderBookController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Order Book',
          style: GoogleFonts.poppins(
            color: colorWhite,
            fontSize: 15,
            fontWeight: FontWeight.bold,
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

  Widget unSelectedfilterItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        orderBookController.filterIndex.value = index;
      },
      child: Icon(icon),
    );
  }

  Widget selectedFilterItem(IconData icon, int index) {
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
          child: Icon(icon),
        ),
      ),
    );
  }

  Widget filterItem(int index, IconData icon) {
    if (index == orderBookController.filterIndex.value) {
      return selectedFilterItem(icon, index);
    } else {
      return unSelectedfilterItem(icon, index);
    }
  }

  Widget filters() {
    return Obx(
      () => Row(
        children: [
          const SizedBox(width: 5),
          filterItem(0, Icons.filter),
          const SizedBox(width: 10),
          filterItem(1, Icons.face),
          const SizedBox(width: 10),
          filterItem(2, Icons.fact_check_rounded),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
