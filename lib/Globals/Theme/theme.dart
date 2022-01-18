import 'package:flutter/material.dart';
import 'package:hollaex/Controllers/main_controller.dart';
import 'package:hollaex/Globals/Constans/colors.dart';

Color getBackgroundColor(MainController mainController){
  if(mainController.isDarkMode.value){
    return colorBlack;
  }else{
    return colorScaffoldColor;
  }
}
Color getCardColor(MainController mainController){
  if(mainController.isDarkMode.value){
    return colorDark;
  }
  else{
    return colorWhite;
  }
}
Color getWhiteBlackTextColor(MainController mainController){
  if(!mainController.isDarkMode.value){
    return Colors.black;
  }
  else{
    return colorWhite;
  }
}
Color getFilterBgColor(MainController mainController){
  if(mainController.isDarkMode.value){
    return colorGrey;
  }
  else{
    return colorWhite;
  }
}