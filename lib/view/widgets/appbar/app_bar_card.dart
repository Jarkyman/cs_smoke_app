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

  /// The horizontal overlap offset for each side of the team cards in the AppBar.
  /// Together they overlap by 56 pixels (28 pixels each) to allow a slanted parallel cut.
  static const double cardOverlapOffset = 28.0;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isCt ? Alignment.centerRight : Alignment.centerLeft,
      child: SizedBox(
        height: context.height20 * 13,
        width: (context.screenWidth / 2) + cardOverlapOffset,
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
            SizedBox(
              height: context.height20 * 13,
              width: (context.screenWidth / 2) + cardOverlapOffset,
              child: ClipPath(
                clipper: SkewedClipper(!isCt),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: isCt
                          ? [
                              Colors.blue.withValues(alpha: 0.5),
                              Colors.transparent,
                            ]
                          : [
                              Colors.transparent,
                              Colors.red.withValues(alpha: 0.5),
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
