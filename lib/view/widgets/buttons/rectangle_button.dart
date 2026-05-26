import 'package:cs_smoke_app/core/helper/dimensions.dart';
import 'package:flutter/material.dart';

class RectangleButton extends StatelessWidget {
  const RectangleButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.height18),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Material(
          color: Color(0xFF002259).withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(context.radius10),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(context.radius10),
            child: Container(
              height: context.height20 * 2,
              width: context.width20 * 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(context.radius10),
                border: Border.all(
                  color: Color(0xFF000a1a),
                  width: context.stroke2,
                ),
              ),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: context.font16,
                      decoration: TextDecoration.none),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
