import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hollaex/Views/OrderBooks/orderbooks_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'WebSocket Demo';
    return GetMaterialApp(
      title: title,
      
      home: OrderBooksView(),
    );
  }
}
