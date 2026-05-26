import 'package:flutter/material.dart';

import '../../../core/helper/analytics_helper.dart';
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
    final teamName = isCt ? 'ct' : 't';
    // mapName is readable here since UtilRow lives inside RadarScreen's route
    final mapName =
        ModalRoute.of(context)?.settings.arguments as String? ?? '';

    return Stack(
      alignment: isCt ? Alignment.bottomRight : Alignment.bottomLeft,
      children: [
        Padding(
          padding: isCt
              ? EdgeInsets.only(
                  left: context.height38, bottom: context.height50)
              : EdgeInsets.only(
                  right: context.height38, bottom: context.height50),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: isCt ? Alignment.centerRight : Alignment.centerLeft,
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
                    AnalyticsHelper.logUtilSelected(
                      utilType: 'smoke',
                      team: teamName,
                      mapName: mapName,
                    );
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
                    AnalyticsHelper.logUtilSelected(
                      utilType: 'flash',
                      team: teamName,
                      mapName: mapName,
                    );
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
                    utilViewModel.toggleUtil(UtilType.molotov, team);
                    AnalyticsHelper.logUtilSelected(
                      utilType: 'molotov',
                      team: teamName,
                      mapName: mapName,
                    );
                  },
                  isCt: isCt,
                ),
                SizedBox(
                  width: context.width10,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
