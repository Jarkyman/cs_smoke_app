import 'package:cs_smoke_app/core/viewmodels/util_view_model.dart';
import 'package:cs_smoke_app/view/screens/radar_screen.dart';
import 'package:cs_smoke_app/view/shared/global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/viewmodels/radar_view_model.dart';

class MapsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final radarViewModel = Provider.of<RadarViewModel>(context);
    final utilViewModel = Provider.of<UtilViewModel>(context);

    return Scaffold(
      backgroundColor: Global.bgColor,
      appBar: AppBar(
        title: Text('Cs2 maps'),
      ),
      body: ListView.builder(
        itemCount: Global.maps.length, // Antallet af elementer i listen
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              radarViewModel.reset();
              utilViewModel.reset();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RadarScreen(),
                  settings: RouteSettings(
                    arguments: Global.maps[index],
                  ),
                ),
              );
            },
            child: Container(
              height: 160, // Juster højden efter behov
              margin: EdgeInsets.all(10), // Afstand mellem felterne
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                image: DecorationImage(
                  colorFilter:
                      ColorFilter.mode(Colors.black38, BlendMode.overlay),
                  image: AssetImage(
                      'assets/img/maps/CS2_${Global.maps[index].toLowerCase()}_map.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Stack(
                  children: [
                    Text(
                      Global.maps[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..color = Colors.black
                            ..strokeWidth = 1),
                    ),
                    Text(
                      Global.maps[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
