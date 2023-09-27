import 'package:cs_smoke_app/core/viewmodels/util_view_model.dart';
import 'package:cs_smoke_app/view/screens/info_screen.dart';
import 'package:cs_smoke_app/view/shared/global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/models/util_model.dart';

class GridViewWidget extends StatefulWidget {
  const GridViewWidget({super.key});

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  bool isUtilSelected = false;
  UtilModel? selectedUtil;

  @override
  Widget build(BuildContext context) {
    final utilViewModel = Provider.of<UtilViewModel>(context);
    final Size size = MediaQuery.of(context).size;
    final String map = 'overpass'; //TODO: Skal ændres når siden vælges

    return Container(
      height: double.maxFinite,
      child: Center(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1),
            itemCount: 1,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              List<UtilModel> tileSmokes = utilViewModel.utils.where((item) {
                if (utilViewModel.isCt) {
                  return (item.location == map &&
                      item.name == utilViewModel.util &&
                      !item.status);
                } else {
                  return (item.location == map &&
                      item.name == utilViewModel.util &&
                      item.status);
                }
              }).toList();

              return Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    color: Global.bgColor,
                    child: Image.asset('assets/img/radar/CS2_${map}_radar.png'),
                  ),
                  utilViewModel.isUtilSelected &&
                          utilViewModel.selectedUtil != null
                      ? Stack(
                          children: [
                            Container(
                              height: double.infinity,
                              width: double.infinity,
                              child: Transform.translate(
                                offset: Offset(
                                  size.width *
                                      utilViewModel.selectedUtil!.position[0],
                                  size.width *
                                      utilViewModel.selectedUtil!.position[1],
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    utilViewModel.reset();
                                  },
                                  child: SizedBox(
                                    height: 16,
                                    width: 16,
                                    child: Center(
                                      child: Image.asset(
                                        'assets/icons/${utilViewModel.selectedUtil!.name}.png',
                                        width: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Stack(
                              children: List.generate(
                                  utilViewModel.selectedUtil!.stands.length,
                                  (idx) {
                                return Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: Transform.translate(
                                    offset: Offset(
                                      size.width *
                                          utilViewModel.selectedUtil!
                                              .stands[idx].position[0],
                                      size.width *
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
                                                      .stands[idx])),
                                        );
                                      },
                                      child: SizedBox(
                                        height: 16,
                                        width: 16,
                                        child: Center(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Container(
                                              height: 12,
                                              width: 12,
                                              color: Colors
                                                  .red, //TODO: Skal være blå ved ct og rød ved t
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
                          children: List.generate(tileSmokes.length, (idx) {
                            return Container(
                              height: double.infinity,
                              width: double.infinity,
                              child: Transform.translate(
                                offset: Offset(
                                  size.width * tileSmokes[idx].position[0],
                                  size.width * tileSmokes[idx].position[1],
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      utilViewModel.selectUtil(tileSmokes[idx]);
                                    });
                                  },
                                  child: SizedBox(
                                    height: 16,
                                    width: 16,
                                    child: Center(
                                      child: Image.asset(
                                        'assets/icons/${tileSmokes[idx].name}.png',
                                        width: 16,
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
