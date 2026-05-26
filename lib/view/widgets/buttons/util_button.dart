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
    return Material(
      color: isSelected
          ? isCt
              ? Colors.blue.withValues(alpha: 0.4)
              : Colors.red.withValues(alpha: 0.4)
          : Colors.grey.withValues(alpha: 0.4),
      borderRadius: BorderRadius.circular(context.radius8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(context.radius8),
        child: Container(
          height: context.height20 * 2,
          width: context.height20 * 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.radius8),
            border: Border.all(
              color: Colors.grey,
              width: context.stroke2,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(context.height8 / 2),
            child: Image.asset(imagePath),
          ),
        ),
      ),
    );
  }
}
