import 'package:get/get.dart';

class MainController extends GetxController {
  RxBool isDarkMode = true.obs;

  void reloadState() {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      isDarkMode.value = !isDarkMode.value;
      isDarkMode.value = !isDarkMode.value;
    });
  }
}
