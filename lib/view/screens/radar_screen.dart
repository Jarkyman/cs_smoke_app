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
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: GestureDetector(
                                  onTap: () {
                                    utilViewModel.reset();
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF002259).withOpacity(0.6),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Color(0xFF000a1a), width: 2),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : SafeArea(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF002259).withOpacity(0.6),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Color(0xFF000a1a), width: 2),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Go Back',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            decoration: TextDecoration.none),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
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
