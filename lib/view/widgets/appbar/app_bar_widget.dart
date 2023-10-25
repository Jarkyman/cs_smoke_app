import 'package:cs_smoke_app/core/helper/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/viewmodels/util_view_model.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final utilViewModel = Provider.of<UtilViewModel>(context);

    return Container(
      height: Dimensions.height20 * 12,
      child: Stack(
        children: [
          AppBarCard(
            utilViewModel: utilViewModel,
            isCt: false,
          ),
          AppBarCard(
            utilViewModel: utilViewModel,
            isCt: true,
          ),
        ],
      ),
    );
  }
}

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
    return Stack(
      alignment: isCt ? Alignment.bottomRight : Alignment.bottomLeft,
      children: [
        Padding(
          padding: isCt
              ? EdgeInsets.only(
                  left: Dimensions.height38, bottom: Dimensions.height50)
              : EdgeInsets.only(
                  right: Dimensions.height38, bottom: Dimensions.height50),
          child: Row(
            mainAxisAlignment:
                isCt ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              SizedBox(
                width: Dimensions.width10,
              ),
              UtilButton(
                imagePath: 'assets/icons/smoke util.png',
                isSelected:
                    isCt ? utilViewModel.isSmokeCt : utilViewModel.isSmokeT,
                onTap: () {
                  if (isCt) {
                    utilViewModel.toggleUtil('smokeCt');
                  } else {
                    utilViewModel.toggleUtil('smokeT');
                  }
                },
                isCt: isCt,
              ),
              SizedBox(
                width: Dimensions.width20,
              ),
              UtilButton(
                imagePath: 'assets/icons/flash util.png',
                isSelected:
                    isCt ? utilViewModel.isFlashCt : utilViewModel.isFlashT,
                onTap: () {
                  if (isCt) {
                    utilViewModel.toggleUtil('flashCt');
                  } else {
                    utilViewModel.toggleUtil('flashT');
                  }
                },
                isCt: isCt,
              ),
              SizedBox(
                width: Dimensions.width20,
              ),
              UtilButton(
                imagePath: isCt
                    ? 'assets/icons/molotov util ct.png'
                    : 'assets/icons/molotov util t.png',
                isSelected:
                    isCt ? utilViewModel.isMolotovCt : utilViewModel.isMolotovT,
                onTap: () {
                  if (isCt) {
                    print('Click');
                    utilViewModel.toggleUtil('molotovCt');
                  } else {
                    utilViewModel.toggleUtil('molotovT');
                  }
                },
                isCt: isCt,
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class UtilButton extends StatelessWidget {
  const UtilButton({
    super.key,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
    required this.isCt,
  });

  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isCt;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Dimensions.height20 * 2,
        width: Dimensions.height20 * 2,
        decoration: BoxDecoration(
          color: isSelected
              ? isCt
                  ? Colors.blue.withOpacity(0.4)
                  : Colors.red.withOpacity(0.4)
              : Colors.grey.withOpacity(0.4),
          borderRadius: BorderRadius.circular(Dimensions.radius8),
          border: Border.all(color: Colors.grey, width: 2),
        ),
        child: Padding(
          padding: EdgeInsets.all(Dimensions.radius8 / 2),
          child: Image.asset(imagePath),
        ),
      ),
    );
  }
}

class SkewedClipper extends CustomClipper<Path> {
  final bool skewLeft;

  SkewedClipper(this.skewLeft);

  @override
  Path getClip(Size size) {
    Path path = Path();
    if (skewLeft) {
      path.lineTo(0, size.height);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width - 60, 0);
    } else {
      path.lineTo(60, size.height);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width, 0);
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
