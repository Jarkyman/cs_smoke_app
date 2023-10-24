import 'package:flutter/material.dart';

class Dimensions {
  static double screenHeight(BuildContext context) {
    // 844 iPhone 12
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context) {
    // 390 iPhone 12
    return MediaQuery.of(context).size.width;
  }

  static double height10(BuildContext context) {
    return MediaQuery.of(context).size.width / 84.4;
  }

  static double height15(BuildContext context) {
    return MediaQuery.of(context).size.height / 56.27;
  }

  static double height18(BuildContext context) {
    return MediaQuery.of(context).size.height / 46.89;
  }

  static double height20(BuildContext context) {
    return MediaQuery.of(context).size.height / 42.2;
  }

  static double height25(BuildContext context) {
    return MediaQuery.of(context).size.height / 33.76;
  }

  static double height30(BuildContext context) {
    return MediaQuery.of(context).size.height / 28.13;
  }

  static double height45(BuildContext context) {
    return MediaQuery.of(context).size.height / 18.76;
  }

  //Dynamic width, padding and margin
  static double width5(BuildContext context) {
    return MediaQuery.of(context).size.height / 168.8;
  }

  static double width10(BuildContext context) {
    return MediaQuery.of(context).size.height / 84.4;
  }

  static double width15(BuildContext context) {
    return MediaQuery.of(context).size.height / 56.27;
  }

  static double width20(BuildContext context) {
    return MediaQuery.of(context).size.height / 42.2;
  }

  static double width30(BuildContext context) {
    return MediaQuery.of(context).size.height / 28.13;
  }

  static double width45(BuildContext context) {
    return MediaQuery.of(context).size.height / 18.76;
  }

  //Font
  static double font16(BuildContext context) {
    return MediaQuery.of(context).size.height / 52.75;
  }

  static double font20(BuildContext context) {
    return MediaQuery.of(context).size.height / 42.2;
  }

  static double font26(BuildContext context) {
    return MediaQuery.of(context).size.height / 32.46;
  }

  //Icons
  static double iconSize16(BuildContext context) {
    return MediaQuery.of(context).size.height / 52.75;
  }

  static double iconSize24(BuildContext context) {
    return MediaQuery.of(context).size.height / 35.17;
  }

  static double iconSize32(BuildContext context) {
    return MediaQuery.of(context).size.height / 26.375;
  }

  //Radius
  static double radius10(BuildContext context) {
    return MediaQuery.of(context).size.height / 84.4;
  }

  static double radius15(BuildContext context) {
    return MediaQuery.of(context).size.height / 56.27;
  }

  static double radius20(BuildContext context) {
    return MediaQuery.of(context).size.height / 42.2;
  }

  static double radius30(BuildContext context) {
    return MediaQuery.of(context).size.height / 28.13;
  }

  //Util and position
  static double position(BuildContext context) {
    return MediaQuery.of(context).size.height / 70.333;
  }

  static double utility(BuildContext context) {
    return MediaQuery.of(context).size.height / 35.167;
  }
}
