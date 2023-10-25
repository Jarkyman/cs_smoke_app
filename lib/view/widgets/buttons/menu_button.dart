import 'package:cs_smoke_app/core/helper/dimensions.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
  });

  final VoidCallback onTap;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: Dimensions.height20 * 3,
          padding: EdgeInsets.all(Dimensions.height10),
          decoration: BoxDecoration(
            color: Colors.grey.shade800, // Mørkegrå farve
            border: Border.all(
              color: Colors.grey.shade600, // Lidt lysere grå border
              width: Dimensions.stroke2,
            ),
            borderRadius: BorderRadius.circular(Dimensions.radius10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: Dimensions.font20,
                ),
              ),
              Icon(
                icon,
                color: Colors.white,
                size: Dimensions.iconSize32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
