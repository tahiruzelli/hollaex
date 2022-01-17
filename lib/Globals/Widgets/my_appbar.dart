import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollaex/Controllers/main_controller.dart';
import 'package:hollaex/Globals/Constans/colors.dart';

buildAppBar(MainController mainController) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(50),
    child: Obx(
      () => AppBar(
        backgroundColor:
            mainController.isDarkMode.value ? colorDarkBlue : colorLightBlue,
        title: const Text('HollaEx'),
        actions: [
          IconButton(
            onPressed: () {
              mainController.isDarkMode.value =
                  !mainController.isDarkMode.value;
            },
            icon: Icon(
              !mainController.isDarkMode.value
                  ? Icons.wb_sunny
                  : Icons.dark_mode,
            ),
          ),
        ],
      ),
    ),
  );
}
