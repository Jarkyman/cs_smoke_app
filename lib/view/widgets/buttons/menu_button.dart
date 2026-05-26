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
      padding: EdgeInsets.all(context.height20),
      child: Material(
        color: Colors.grey.shade800, // Mørkegrå farve
        borderRadius: BorderRadius.circular(context.radius10),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(context.radius10),
          child: Container(
            height: context.height20 * 3,
            padding: EdgeInsets.all(context.height10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade600, // Lidt lysere grå border
                width: context.stroke2,
              ),
              borderRadius: BorderRadius.circular(context.radius10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: context.font20,
                  ),
                ),
                Icon(
                  icon,
                  color: Colors.white,
                  size: context.iconSize32,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
