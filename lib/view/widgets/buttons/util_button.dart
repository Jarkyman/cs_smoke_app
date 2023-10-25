import 'package:flutter/material.dart';

import '../../../core/helper/dimensions.dart';

class UtilButton extends StatelessWidget {
  const UtilButton({
    super.key,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
    required this.isCt,
  });

  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isCt;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Dimensions.height20 * 2,
        width: Dimensions.height20 * 2,
        decoration: BoxDecoration(
          color: isSelected
              ? isCt
                  ? Colors.blue.withOpacity(0.4)
                  : Colors.red.withOpacity(0.4)
              : Colors.grey.withOpacity(0.4),
          borderRadius: BorderRadius.circular(Dimensions.radius8),
          border: Border.all(color: Colors.grey, width: 2),
        ),
        child: Padding(
          padding: EdgeInsets.all(Dimensions.radius8 / 2),
          child: Image.asset(imagePath),
        ),
      ),
    );
  }
}
