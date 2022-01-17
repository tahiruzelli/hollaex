import 'package:flutter/material.dart';
import 'package:hollaex/Views/OrderBooks/Pages/asks_view.dart';
import 'package:hollaex/Views/OrderBooks/Pages/bids_view.dart';

class BidsAsksView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: Column(
          children: [
            BidsView(),
            AsksView(),
          ],
        ),
      ),
    );
  }
}
