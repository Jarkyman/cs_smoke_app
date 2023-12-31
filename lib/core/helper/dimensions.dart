import 'package:flutter/material.dart';

class Dimensions {
  static var screenWidth =
      MediaQueryData.fromView(WidgetsBinding.instance.window)
          .size
          .width; // 390 iPhone 12

  static var screenHeight =
      MediaQueryData.fromView(WidgetsBinding.instance.window)
          .size
          .height; // 844 iPhone 12

  //Dynamic height, padding and margin
  static double height8 = screenHeight / 105.5;
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height18 = screenHeight / 46.889;
  static double height20 = screenHeight / 42.2;
  static double height25 = screenHeight / 33.76;
  static double height28 = screenHeight / 30.143;
  static double height30 = screenHeight / 28.13;
  static double height38 = screenHeight / 22.21;
  static double height45 = screenHeight / 18.76;
  static double height50 = screenHeight / 16.88;
  static double height56 = screenHeight / 15.07;

  //Dynamic width, padding and margin
  static double width5 = screenHeight / 168.8;
  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.27;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.13;
  static double width45 = screenHeight / 18.76;

  //Font
  static double font16 = screenHeight / 52.75;
  static double font20 = screenHeight / 42.2;
  static double font26 = screenHeight / 32.46;
  static double font48 = screenHeight / 17.583;

  //Icons
  static double iconSize16 = screenHeight / 52.75;
  static double iconSize24 = screenHeight / 35.17;
  static double iconSize32 = screenHeight / 26.375;

  //Stroke
  static double stroke1 = screenHeight / 844;
  static double stroke2 = screenHeight / 422;
  static double stroke4 = screenHeight / 211;

  //Radius
  static double radius8 = screenHeight / 105.5;
  static double radius10 = screenHeight / 84.4;
  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius28 = screenHeight / 30.143;
  static double radius30 = screenHeight / 28.13;

  //Util and position
  static double position = screenHeight / 70.333;
  static double utility = screenHeight / 35.167;
}
