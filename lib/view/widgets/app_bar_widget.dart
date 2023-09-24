import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      bottom: PreferredSize(
        preferredSize: Size.zero,
        child: Column(
          children: [
            Text(
              'Radar Screen',
              style: TextStyle(
                  color: const Color(0xFF4A64FE),
                  fontWeight: FontWeight.w900,
                  fontSize: 16.0),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: const Color(0xFF4A64FE),
            ),
          ],
        ),
      ),
    );
  }
}
