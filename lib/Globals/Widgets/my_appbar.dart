import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hollaex/Controllers/main_controller.dart';
import 'package:hollaex/Globals/Constans/colors.dart';
import 'package:hollaex/Globals/Constans/numbers.dart';
import 'package:hollaex/Globals/Constans/strings.dart';

buildAppBar(MainController mainController) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(50),
    child: Obx(
      () => AppBar(
        centerTitle: true,
        backgroundColor:
            mainController.isDarkMode.value ? colorDarkBlue : colorLightBlue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: mainAppbarTextPadding,
              ),
              child: Text(
                mainAppbarText,
                style: GoogleFonts.poppins(),
              ),
            ),
            Image.asset(
              'assets/images/hollaexIcon.png',
              height: 25,
              width: 25,
            )
          ],
        ),
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
