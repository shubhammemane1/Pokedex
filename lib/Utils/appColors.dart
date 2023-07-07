import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/Utils/util.dart';

//Const Colors to use in entire Application
class AppColors {
  static Color primaryColor = const Color(0xFFCBFFAA);
  static Color transperent = Colors.transparent;
  static Color black = const Color(0xFF1D1D1D);
  static Color white = const Color(0xFFFFFFFF);

  static const Color grey = Color(0xFFE1E1E1);
  static const Color grey100 = Color(0xFFE8E8E8);
  static const Color grey300 = Color(0xFFB6B7B9);
  static const Color grey500 = Color(0xFF868585);
  static const Color grey550 = Color(0xFF8F8E8E);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey700 = Color(0xFF515151);
  static const Color grey750 = Color(0xFF474747);
  static const Color grey800 = Color(0xFF3D3D3D);

  //categories Color
  static Color categoryRed = const Color(0xFFFF2121);
  static Color categorYellow = const Color(0xCAFFD000);
  static Color categoryGreen = const Color(0xFF46FF4F);
  static Color categoryBlue = const Color(0xFF00B7FF);


  //category Colors
  static Color grass = const Color(0xFF00FF55);
  static Color water = const Color(0xFF00C3FF);
  static Color electric = const Color(0xFFE5FF00);
  static Color fire = const Color(0xFFFF7300);
  static Color poison = const Color(0xA28C00FF);
  static Color flying = const Color(0xFFFFFFFF);
  static Color psychic = const Color(0xFF000000);  
  static Color fighting = const Color(0xFFFF0000);  
  static Color ground = const Color(0xD6FF7300);  
  static Color rock = const Color(0xD4696969);  
  static Color ghost = const Color(0xD2414141);  
  static Color steel = const Color(0x83E9E9E9);  
  static Color ice = const Color(0xD527CDFF); 
  static Color dark = const Color(0xD36E6E6E); 
  static Color normal = const Color(0xFFC7C7C7); 
  static Color bug = const Color(0xEF00FF55); 
  static Color dragon = const Color(0xEEFFBB00); 
  
  static Color titleColor = Get.isDarkMode ? AppColors.white : AppColors.grey600; 
  static Color iconColor = Get.isDarkMode ? AppColors.white : AppColors.grey700; 
  static Color textColor = Get.isDarkMode ? AppColors.white : AppColors.black; 

}
