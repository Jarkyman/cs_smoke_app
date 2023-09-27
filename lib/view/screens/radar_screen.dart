import 'package:cs_smoke_app/view/shared/global.dart';
import 'package:cs_smoke_app/view/widgets/raw_gesture_detector_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/viewmodels/util_view_model.dart';
import '../widgets/app_bar_widget.dart';
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
              height: MediaQuery.of(context).size.height - 200,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
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
                    utilViewModel.isUtilSelected
                        ? SafeArea(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  utilViewModel.reset();
                                },
                                iconSize: 24,
                                splashRadius: 10,
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Global.blue),
                                ),
                              ),
                            ),
                          )
                        : Container(),
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
