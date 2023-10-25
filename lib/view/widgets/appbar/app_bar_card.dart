import 'package:cs_smoke_app/view/widgets/appbar/util_row.dart';
import 'package:flutter/material.dart';

import '../../../core/helper/dimensions.dart';
import '../../../core/viewmodels/util_view_model.dart';
import '../skewed_clipper.dart';

class AppBarCard extends StatelessWidget {
  const AppBarCard({
    super.key,
    required this.utilViewModel,
    required this.isCt,
  });

  final UtilViewModel utilViewModel;
  final bool isCt;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isCt ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        height: Dimensions.height20 * 13,
        width: (Dimensions.screenWidth / 2) + 28,
        child: Stack(
          alignment: isCt ? Alignment.topRight : Alignment.topLeft,
          children: [
            Align(
              alignment: isCt ? Alignment.centerRight : Alignment.centerLeft,
              child: ClipPath(
                clipper: SkewedClipper(!isCt),
                child: Container(
                  child: isCt
                      ? Image.asset(
                          'assets/img/Counter Terroist outline.png',
                        )
                      : Image.asset(
                          'assets/img/Terroist outline.png',
                        ),
                ),
              ),
            ),
            Container(
              height: Dimensions.height20 * 13,
              width: (Dimensions.screenWidth / 2) + 28,
              child: ClipPath(
                clipper: SkewedClipper(!isCt),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: isCt
                          ? [
                              Colors.blue.withOpacity(0.5),
                              Colors.transparent,
                            ]
                          : [
                              Colors.transparent,
                              Colors.red.withOpacity(0.5),
                            ],
                    ),
                  ),
                  child: UtilRow(isCt: isCt, utilViewModel: utilViewModel),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
