import 'package:cs_smoke_app/view/shared/global.dart';
import 'package:flutter/material.dart';

class MapsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global.bgColor,
      appBar: AppBar(
        title: Text('Cs2 maps'),
      ),
      body: ListView.builder(
        itemCount: Global.maps.length, // Antallet af elementer i listen
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
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
