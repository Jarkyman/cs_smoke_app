import 'package:flutter/material.dart';

class SkewedClipper extends CustomClipper<Path> {
  final bool skewLeft;

  SkewedClipper(this.skewLeft);

  @override
  Path getClip(Size size) {
    Path path = Path();
    // The overlap between the two AppBarCards is 56 pixels (28 pixels each).
    // Using a fixed skewAmount slightly larger than the overlap (e.g. 58)
    // creates a perfectly parallel 2 pixel gap on all screen sizes.
    double skewAmount = 58.0;
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
