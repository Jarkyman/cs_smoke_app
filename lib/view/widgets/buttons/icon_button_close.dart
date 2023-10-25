import 'package:cs_smoke_app/core/helper/dimensions.dart';
import 'package:flutter/material.dart';

class IconButtonClose extends StatelessWidget {
  const IconButtonClose({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height18),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: Dimensions.height20 * 2,
            width: Dimensions.height20 * 2,
            decoration: BoxDecoration(
              color: Color(0xFF002259).withOpacity(0.6),
              borderRadius: BorderRadius.circular(Dimensions.radius10),
              border: Border.all(
                color: Color(0xFF000a1a),
                width: Dimensions.stroke2,
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: Dimensions.iconSize24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
