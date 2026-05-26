import 'package:cs_smoke_app/core/helper/dimensions.dart';
import 'package:cs_smoke_app/core/viewmodels/util_view_model.dart';
import 'package:cs_smoke_app/view/screens/info_screen.dart';
import 'package:cs_smoke_app/view/shared/global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/models/util_model.dart';
import '../../core/viewmodels/radar_view_model.dart';

class GridViewWidget extends StatefulWidget {
  const GridViewWidget({super.key, required this.mapName});
  final String mapName;

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  bool isUtilSelected = false;
  UtilModel? selectedUtil;

  @override
  Widget build(BuildContext context) {
    final utilViewModel = Provider.of<UtilViewModel>(context);
    final radarViewModel = Provider.of<RadarViewModel>(context);

    return SizedBox(
      height: double.infinity,
      child: Center(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1),
            itemCount: 1,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              List<UtilModel> tileSmokes = utilViewModel.utils.where((item) {
                if (utilViewModel.isCt) {
                  return (item.location == widget.mapName.toLowerCase() &&
                      item.name == utilViewModel.util &&
                      !item.status);
                } else {
                  return (item.location == widget.mapName.toLowerCase() &&
                      item.name == utilViewModel.util &&
                      item.status);
                }
              }).toList();

              return utilViewModel.showNames
                  ? Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          color: Global.bgColor,
                          child: Image.asset(
                            'assets/img/callouts/CS2_${widget.mapName.toLowerCase()}_radar_name.png',
                          ),
                        ),
                      ],
                    )
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          color: Global.bgColor,
                          child: Image.asset(
                            'assets/img/radar/CS2_${widget.mapName.toLowerCase()}_radar.png',
                          ),
                        ),
                        utilViewModel.isUtilSelected &&
                                utilViewModel.selectedUtil != null
                            ? Stack(
                                children: [
                                  SizedBox(
                                    height: double.infinity,
                                    width: double.infinity,
                                    child: Transform.translate(
                                      offset: Offset(
                                        context.screenWidth *
                                            utilViewModel
                                                .selectedUtil!.position[0],
                                        context.screenWidth *
                                            utilViewModel
                                                .selectedUtil!.position[1],
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          utilViewModel.reset();
                                        },
                                        child: SizedBox(
                                          height:
                                              radarViewModel.utilScale(context),
                                          width:
                                              radarViewModel.utilScale(context),
                                          child: Center(
                                            child: Image.asset(
                                              'assets/icons/${utilViewModel.selectedUtil!.name}.png',
                                              width: radarViewModel
                                                  .utilScale(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Stack(
                                    children: List.generate(
                                        utilViewModel.selectedUtil!.stands
                                            .length, (idx) {
                                      return SizedBox(
                                        height: double.infinity,
                                        width: double.infinity,
                                        child: Transform.translate(
                                          offset: Offset(
                                            context.screenWidth *
                                                utilViewModel.selectedUtil!
                                                    .stands[idx].position[0],
                                            context.screenWidth *
                                                utilViewModel.selectedUtil!
                                                    .stands[idx].position[1],
                                          ),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const InfoScreen(),
                                                  settings: RouteSettings(
                                                      arguments: utilViewModel
                                                          .selectedUtil!
                                                          .stands[idx]),
                                                ),
                                              );
                                            },
                                            child: SizedBox(
                                              height: radarViewModel
                                                  .posScale(context),
                                              width: radarViewModel
                                                  .posScale(context),
                                              child: Center(
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  child: Container(
                                                    height: radarViewModel
                                                        .posScale(context),
                                                    width: radarViewModel
                                                        .posScale(context),
                                                    color: utilViewModel.isT
                                                        ? Colors.red
                                                        : Colors.blue,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ],
                              )
                            : Stack(
                                children:
                                    List.generate(tileSmokes.length, (idx) {
                                  return SizedBox(
                                    height: double.infinity,
                                    width: double.infinity,
                                    child: Transform.translate(
                                      offset: Offset(
                                        context.screenWidth *
                                            tileSmokes[idx].position[0],
                                        context.screenWidth *
                                            tileSmokes[idx].position[1],
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            utilViewModel
                                                .selectUtil(tileSmokes[idx]);
                                          });
                                        },
                                        child: SizedBox(
                                          height:
                                              radarViewModel.utilScale(context),
                                          width:
                                              radarViewModel.utilScale(context),
                                          child: Center(
                                            child: Image.asset(
                                              'assets/icons/${tileSmokes[idx].name}.png',
                                              width: radarViewModel
                                                  .utilScale(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                      ],
                    );
            }),
      ),
    );
  }
}
