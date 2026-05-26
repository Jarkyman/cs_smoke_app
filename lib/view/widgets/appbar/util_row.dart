import 'package:flutter/material.dart';

import '../../../core/helper/dimensions.dart';
import '../../../core/viewmodels/util_view_model.dart';
import '../../../core/models/enums.dart';
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
    final team = isCt ? Team.ct : Team.t;

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
                    utilViewModel.isUtilTypeSelected(UtilType.smoke, team),
                onTap: () {
                  utilViewModel.toggleUtil(UtilType.smoke, team);
                },
                isCt: isCt,
              ),
              SizedBox(
                width: context.width20,
              ),
              UtilButton(
                imagePath: 'assets/icons/flash util.png',
                isSelected:
                    utilViewModel.isUtilTypeSelected(UtilType.flash, team),
                onTap: () {
                  utilViewModel.toggleUtil(UtilType.flash, team);
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
                    utilViewModel.isUtilTypeSelected(UtilType.molotov, team),
                onTap: () {
                  debugPrint('Click');
                  utilViewModel.toggleUtil(UtilType.molotov, team);
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
