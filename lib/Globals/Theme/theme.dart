import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollaex/Controllers/main_controller.dart';
import 'package:hollaex/Globals/Constans/colors.dart';
MainController mainController =Get.find();
Color getBackgroundColor(){
  if(mainController.isDarkMode.value){
    return colorBlack;
  }else{
    return colorScaffoldColor;
  }
}
Color getCardColor(){
  if(mainController.isDarkMode.value){
    return colorDark;
  }
  else{
    return colorWhite;
  }
}
Color getWhiteBlackTextColor(){
  if(!mainController.isDarkMode.value){
    return Colors.black;
  }
  else{
    return colorWhite;
  }
}
Color getFilterBgColor(){
  if(mainController.isDarkMode.value){
    return colorGrey;
  }
  else{
    return colorWhite;
  }
}