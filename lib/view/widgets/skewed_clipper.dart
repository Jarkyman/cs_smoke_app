import 'package:flutter/material.dart';

class SkewedClipper extends CustomClipper<Path> {
  final bool skewLeft;

  SkewedClipper(this.skewLeft);

  @override
  Path getClip(Size size) {
    Path path = Path();
    double skewAmount = size.width * 0.25;
    if (skewLeft) {
      path.lineTo(0, size.height);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width - skewAmount, 0);
    } else {
      path.lineTo(skewAmount, size.height);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width, 0);
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper is SkewedClipper && oldClipper.skewLeft != skewLeft;
  }
}
