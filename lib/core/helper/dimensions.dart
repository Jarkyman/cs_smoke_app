import 'package:flutter/material.dart';

extension Dimensions on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width; // 390 iPhone 12
  double get screenHeight => MediaQuery.sizeOf(this).height; // 844 iPhone 12

  //Dynamic height, padding and margin
  double get height8 => screenHeight / 105.5;
  double get height10 => screenHeight / 84.4;
  double get height15 => screenHeight / 56.27;
  double get height18 => screenHeight / 46.889;
  double get height20 => screenHeight / 42.2;
  double get height25 => screenHeight / 33.76;
  double get height28 => screenHeight / 30.143;
  double get height30 => screenHeight / 28.13;
  double get height38 => screenHeight / 22.21;
  double get height45 => screenHeight / 18.76;
  double get height50 => screenHeight / 16.88;
  double get height56 => screenHeight / 15.07;

  //Dynamic width, padding and margin
  double get width5 => screenWidth / 78.0;
  double get width10 => screenWidth / 39.0;
  double get width15 => screenWidth / 26.0;
  double get width20 => screenWidth / 19.5;
  double get width30 => screenWidth / 13.0;
  double get width45 => screenWidth / 8.667;

  //Font
  double get font16 => screenHeight / 52.75;
  double get font20 => screenHeight / 42.2;
  double get font26 => screenHeight / 32.46;
  double get font48 => screenHeight / 17.583;

  //Icons
  double get iconSize16 => screenHeight / 52.75;
  double get iconSize24 => screenHeight / 35.17;
  double get iconSize32 => screenHeight / 26.375;

  //Stroke
  double get stroke1 => screenHeight / 844;
  double get stroke2 => screenHeight / 422;
  double get stroke4 => screenHeight / 211;

  //Radius
  double get radius8 => screenHeight / 105.5;
  double get radius10 => screenHeight / 84.4;
  double get radius15 => screenHeight / 56.27;
  double get radius20 => screenHeight / 42.2;
  double get radius28 => screenHeight / 30.143;
  double get radius30 => screenHeight / 28.13;

  //Util and position
  double get position => screenHeight / 70.333;
  double get utility => screenHeight / 35.167;
}
