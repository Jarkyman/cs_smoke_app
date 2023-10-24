import 'package:cs_smoke_app/core/helper/dimensions.dart';
import 'package:flutter/material.dart';

class RectangleButton extends StatelessWidget {
  const RectangleButton({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height18(context)),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 40,
            width: 80,
            decoration: BoxDecoration(
              color: Color(0xFF002259).withOpacity(0.6),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0xFF000a1a), width: 2),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    decoration: TextDecoration.none),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
