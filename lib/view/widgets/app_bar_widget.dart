import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
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
                        padding: const EdgeInsets.only(right: 18.0, bottom: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            UtilButton(
                              imagePath: 'assets/icons/smoke util.png',
                              isSelected: false,
                            ),
                            UtilButton(
                              imagePath: 'assets/icons/flash util.png',
                              isSelected: false,
                            ),
                            UtilButton(
                              imagePath: 'assets/icons/molotov util t.png',
                              isSelected: false,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
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
                ),
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
  });

  final imagePath;
  final isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image.asset(imagePath),
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
