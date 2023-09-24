import 'package:cs_smoke_app/core/viewmodels/radar_view_model.dart';
import 'package:cs_smoke_app/core/viewmodels/util_view_model.dart';
import 'package:cs_smoke_app/view/shared/global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/models/smoke_model.dart';

class GridViewWidget extends StatefulWidget {
  const GridViewWidget({super.key});

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  bool isUtilSelected = false;
  Smoke? selectedUtil;

  @override
  Widget build(BuildContext context) {
    final radarViewModel = Provider.of<RadarViewModel>(context);
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
              List<Smoke> tileSmokes = utilViewModel.smokes
                  .where((item) => item.location == map)
                  .toList();

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
                          children: List.generate(
                              utilViewModel.selectedUtil!.stands.length, (idx) {
                            return Container(
                              height: double.infinity,
                              width: double.infinity,
                              //color: Colors.yellow.withOpacity(0.05),
                              child: Transform.translate(
                                offset: Offset(
                                  size.width *
                                      utilViewModel.selectedUtil!.stands[idx]
                                          [0],
                                  size.width *
                                      utilViewModel.selectedUtil!.stands[idx]
                                          [1],
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                  },
                                  child: SizedBox(
                                    height: 16,
                                    width: 16,
                                    child: Center(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Container(
                                          height: 12,
                                          width: 12,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        )
                      : Stack(
                          children: List.generate(tileSmokes.length, (idx) {
                            return Container(
                              height: double.infinity,
                              width: double.infinity,
                              //color: Colors.yellow.withOpacity(0.05),
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
                        )
                ],
              );
            }),
      ),
    );
  }
}

class SmokeIndicator extends StatelessWidget {
  const SmokeIndicator({
    super.key,
    required this.tileSmoke,
  });

  final Smoke tileSmoke;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('object');
      },
      child: SizedBox(
        height: 16,
        width: 16,
        child: Center(
          child: Image.asset(
            'assets/icons/${tileSmoke.name}.png',
            width: 16,
          ),
        ),
      ),
    );
  }
}
