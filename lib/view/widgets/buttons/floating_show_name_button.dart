import 'package:cs_smoke_app/core/helper/dimensions.dart';
import 'package:flutter/material.dart';

class FloatingShowNameButton extends StatelessWidget {
  const FloatingShowNameButton({
    super.key,
    required this.onTap,
    this.bannerPadding = 0,
  });

  final VoidCallback onTap;
  final double bannerPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bannerPadding),
      child: SizedBox(
        width: Dimensions.height56,
        height: Dimensions.height56,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: onTap,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Color(0xFF000a1a),
                width: Dimensions.stroke2,
              ),
              borderRadius: BorderRadius.circular(Dimensions.radius30),
            ),
            backgroundColor: Color(0xFF002259).withOpacity(0.6),
            child: Container(
              width: Dimensions.iconSize32,
              child: Image.asset(
                'assets/icons/map_icon.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
