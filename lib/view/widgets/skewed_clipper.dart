import 'package:flutter/material.dart';

class SkewedClipper extends CustomClipper<Path> {
  final bool skewLeft;

  SkewedClipper(this.skewLeft);

  /// The default skew amount for clipping.
  /// The overlap between the two AppBarCards is 56 pixels (28 pixels each).
  /// Using a fixed skewAmount slightly larger than the overlap (e.g. 58)
  /// creates a perfectly parallel 2 pixel gap on all screen sizes.
  static const double defaultSkewAmount = 58.0;

  @override
  Path getClip(Size size) {
    Path path = Path();
    if (skewLeft) {
      path.lineTo(0, size.height);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width - defaultSkewAmount, 0);
    } else {
      path.lineTo(defaultSkewAmount, size.height);
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
