import 'package:cs_smoke_app/core/helper/dimensions.dart';
import 'package:cs_smoke_app/view/shared/global.dart';
import 'package:cs_smoke_app/view/widgets/raw_gesture_detector_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/viewmodels/util_view_model.dart';
import '../widgets/appbar/app_bar_widget.dart';
import '../widgets/buttons/icon_button_close.dart';
import '../widgets/buttons/rectangle_button.dart';
import '../widgets/grid_view_widget.dart';

class RadarScreen extends StatelessWidget {
  const RadarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final utilViewModel = Provider.of<UtilViewModel>(context);
    final String mapName =
        ModalRoute.of(context)!.settings.arguments as String ?? '';

    return Scaffold(
      /*appBar: PreferredSize(
        preferredSize: Size.fromHeight(180),
        child: AppBarWidget(),
      ),*/
      body: Stack(
        children: [
          AppBarWidget(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.screenHeight - (Dimensions.height20 * 10),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20 * 2),
                  topRight: Radius.circular(Dimensions.radius20 * 2),
                ),
                child: Stack(
                  children: [
                    Container(
                      color: Global.bgColor,
                      child: Center(
                          child: RawGestureDetectorWidget(
                              child: GridViewWidget(
                        mapName: mapName,
                      ))),
                    ),
                    SafeArea(
                      child: utilViewModel.isUtilSelected
                          ? IconButtonClose(
                              onTap: () {
                                utilViewModel.reset();
                              },
                            )
                          : RectangleButton(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              text: 'Go Back',
                            ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
