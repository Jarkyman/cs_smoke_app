import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/viewmodels/util_view_model.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final utilViewModel = Provider.of<UtilViewModel>(context);

    return Container(
      height: 240,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Stack(
              children: [
                Container(
                  height: 260,
                  width: (MediaQuery.of(context).size.width / 2) + 28,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: ClipPath(
                      clipper: SkewedClipper(true),
                      child: Container(
                        child: Image.asset(
                          'assets/img/Terroist outline.png',
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 260,
                  width: (MediaQuery.of(context).size.width / 2) + 28,
                  child: ClipPath(
                    clipper: SkewedClipper(true),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.transparent,
                            Colors.red.withOpacity(0.5),
                          ],
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 38.0, bottom: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                UtilButton(
                                  imagePath: 'assets/icons/smoke util.png',
                                  isSelected: utilViewModel.isSmokeT,
                                  onTap: () {
                                    utilViewModel.toggleUtil('smokeT');
                                  },
                                  isCt: false,
                                ),
                                UtilButton(
                                  imagePath: 'assets/icons/flash util.png',
                                  isSelected: utilViewModel.isFlashT,
                                  onTap: () {
                                    utilViewModel.toggleUtil('flashT');
                                  },
                                  isCt: false,
                                ),
                                UtilButton(
                                  imagePath: 'assets/icons/molotov util t.png',
                                  isSelected: utilViewModel.isMolotovT,
                                  onTap: () {
                                    utilViewModel.toggleUtil('molotovT');
                                  },
                                  isCt: false,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 260,
              width: (MediaQuery.of(context).size.width / 2) + 28,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: ClipPath(
                      clipper: SkewedClipper(false),
                      child: Container(
                        child: Image.asset(
                          'assets/img/Counter Terroist outline.png',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 260,
                    width: (MediaQuery.of(context).size.width / 2) + 28,
                    child: ClipPath(
                      clipper: SkewedClipper(false),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.blue.withOpacity(0.5),
                              Colors.transparent,
                            ],
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 38.0, bottom: 50),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  UtilButton(
                                    imagePath: 'assets/icons/smoke util.png',
                                    isSelected: utilViewModel.isSmokeCt,
                                    onTap: () {
                                      utilViewModel.toggleUtil('smokeCt');
                                    },
                                    isCt: true,
                                  ),
                                  UtilButton(
                                    imagePath: 'assets/icons/flash util.png',
                                    isSelected: utilViewModel.isFlashCt,
                                    onTap: () {
                                      utilViewModel.toggleUtil('flashCt');
                                    },
                                    isCt: true,
                                  ),
                                  UtilButton(
                                    imagePath:
                                        'assets/icons/molotov util ct.png',
                                    isSelected: utilViewModel.isMolotovCt,
                                    onTap: () {
                                      utilViewModel.toggleUtil('molotovCt');
                                    },
                                    isCt: true,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: isSelected
              ? isCt
                  ? Colors.blue.withOpacity(0.4)
                  : Colors.red.withOpacity(0.4)
              : Colors.grey.withOpacity(0.4),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
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
