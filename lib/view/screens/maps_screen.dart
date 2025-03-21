import 'dart:math';

import 'package:bordered_text/bordered_text.dart';
import 'package:cs_smoke_app/core/helper/dimensions.dart';
import 'package:cs_smoke_app/core/helper/json_data_handler.dart';
import 'package:cs_smoke_app/core/viewmodels/util_view_model.dart';
import 'package:cs_smoke_app/view/screens/menu_screen.dart';
import 'package:cs_smoke_app/view/screens/radar_screen.dart';
import 'package:cs_smoke_app/view/shared/global.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/helper/notification_api.dart';
import '../../core/models/util_model.dart';
import '../../core/viewmodels/radar_view_model.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  final dataHandler = JsonDataHandler();

  @override
  void initState() {
    super.initState();
    NotificationApi.init(initScheduled: true);
    listenNotifications();

    readData();

    Random random = Random();
    String randomMap = Global.maps[random.nextInt(Global.maps.length)];
    NotificationApi.showScheduledNotification(
      title: 'Go practice now',
      body:
          'Get in the game! Click to dive into $randomMap and perfect your utility skills. Master smokes, flashes, and molotovs to dominate the battlefield',
      payload: randomMap,
      //scheduledDate: DateTime.now().add(Duration(seconds: 10)), //Test
    );
  }

  void readData() async {
    await dataHandler.fetchAndSaveData();
  }

  void listenNotifications() =>
      NotificationApi.onNotifications.stream.listen(onClickedNotification);

  void onClickedNotification(String? payload) {
    print('GO to: $payload');
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const RadarScreen(),
      settings: RouteSettings(
        arguments: payload,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final radarViewModel = Provider.of<RadarViewModel>(context);
    final utilViewModel = Provider.of<UtilViewModel>(context);
    utilViewModel.loadData();

    return Scaffold(
      backgroundColor: Global.bgColor,
      appBar: AppBar(
        leading: Image.asset(
          'assets/icons/Logo.png',
        ),
        title: Text(
          'Maps',
          style: TextStyle(
            fontSize: Dimensions.font26,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MenuScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.menu,
              size: Dimensions.iconSize24,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: Global.maps.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () async {
              radarViewModel.reset();
              utilViewModel.reset();
              utilViewModel.toggleUtil('smokeT');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RadarScreen(),
                  settings: RouteSettings(
                    arguments: Global.maps[index],
                  ),
                ),
              );
              await FirebaseAnalytics.instance.logEvent(
                name: Global.maps[index],
              );
            },
            child: Container(
              height: Dimensions.height20 * 8,
              margin: EdgeInsets.all(Dimensions.height10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius28),
                image: DecorationImage(
                  colorFilter:
                      const ColorFilter.mode(Colors.black38, BlendMode.overlay),
                  image: AssetImage(
                      'assets/img/maps/CS2_${Global.maps[index].toLowerCase()}_map.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: BorderedText(
                  strokeWidth: Dimensions.stroke4,
                  strokeColor: Colors.black,
                  child: Text(
                    Global.maps[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Dimensions.font48,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
