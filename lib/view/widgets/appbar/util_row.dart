import 'package:flutter/material.dart';

import '../../../core/helper/dimensions.dart';
import '../../../core/viewmodels/util_view_model.dart';
import '../buttons/util_button.dart';


class UtilRow extends StatelessWidget {
  const UtilRow({
    super.key,
    required this.isCt,
    required this.utilViewModel,
  });

  final bool isCt;
  final UtilViewModel utilViewModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: isCt ? Alignment.bottomRight : Alignment.bottomLeft,
      children: [
        Padding(
          padding: isCt
              ? EdgeInsets.only(
                  left: context.height38, bottom: context.height50)
              : EdgeInsets.only(
                  right: context.height38, bottom: context.height50),
          child: Row(
            mainAxisAlignment:
                isCt ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              SizedBox(
                width: context.width10,
              ),
              UtilButton(
                imagePath: 'assets/icons/smoke util.png',
                isSelected:
                    isCt ? utilViewModel.isSmokeCt : utilViewModel.isSmokeT,
                onTap: () {
                  if (isCt) {
                    utilViewModel.toggleUtil('smokeCt');
                  } else {
                    utilViewModel.toggleUtil('smokeT');
                  }
                },
                isCt: isCt,
              ),
              SizedBox(
                width: context.width20,
              ),
              UtilButton(
                imagePath: 'assets/icons/flash util.png',
                isSelected:
                    isCt ? utilViewModel.isFlashCt : utilViewModel.isFlashT,
                onTap: () {
                  if (isCt) {
                    utilViewModel.toggleUtil('flashCt');
                  } else {
                    utilViewModel.toggleUtil('flashT');
                  }
                },
                isCt: isCt,
              ),
              SizedBox(
                width: context.width20,
              ),
              UtilButton(
                imagePath: isCt
                    ? 'assets/icons/molotov util ct.png'
                    : 'assets/icons/molotov util t.png',
                isSelected:
                    isCt ? utilViewModel.isMolotovCt : utilViewModel.isMolotovT,
                onTap: () {
                  if (isCt) {
                    debugPrint('Click');
                    utilViewModel.toggleUtil('molotovCt');
                  } else {
                    utilViewModel.toggleUtil('molotovT');
                  }
                },
                isCt: isCt,
              ),
              SizedBox(
                width: context.width10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
