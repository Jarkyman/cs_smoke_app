import 'package:cs_smoke_app/view/shared/global.dart';
import 'package:cs_smoke_app/view/widgets/app_bar_widget.dart';
import 'package:cs_smoke_app/view/widgets/raw_gesture_detector_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/viewmodels/util_view_model.dart';
import '../widgets/grid_view_widget.dart';

class RadarScreen extends StatelessWidget {
  const RadarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final utilViewModel = Provider.of<UtilViewModel>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: AppBarWidget(),
      ),
      body: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        child: Stack(
          children: [
            Container(
              color: Global.bgColor,
              child: Center(
                  child: RawGestureDetectorWidget(child: GridViewWidget())),
            ),
            utilViewModel.isUtilSelected
                ? SafeArea(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 50,
                        width: 140,
                        child: ElevatedButton(
                          onPressed: () {
                            utilViewModel.reset();
                          },
                          child: Container(),
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
