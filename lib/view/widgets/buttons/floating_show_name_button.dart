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
        width: context.height56,
        height: context.height56,
        child: FittedBox(
          child: FloatingActionButton(
            tooltip: 'Show/Hide names',
            onPressed: onTap,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Color(0xFF000a1a),
                width: context.stroke2,
              ),
              borderRadius: BorderRadius.circular(context.radius30),
            ),
            backgroundColor: Color(0xFF002259).withValues(alpha: 0.6),
            child: SizedBox(
              width: context.iconSize32,
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
