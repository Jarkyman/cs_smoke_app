import 'dart:math';
import 'dart:async';

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
import '../../core/models/enums.dart';
import '../../core/viewmodels/radar_view_model.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  final dataHandler = JsonDataHandler();
  StreamSubscription? _notificationSubscription;

  @override
  void initState() {
    super.initState();
    NotificationApi.init(initScheduled: true);
    listenNotifications();

    readData();
    Provider.of<UtilViewModel>(context, listen: false).loadData();

    Random random = Random();
    String randomMap = Global.maps[random.nextInt(Global.maps.length)];
    NotificationApi.cancelAll().then((_) {
      NotificationApi.showScheduledNotification(
        title: 'Go practice now',
        body:
            'Get in the game! Click to dive into $randomMap and perfect your utility skills. Master smokes, flashes, and molotovs to dominate the battlefield',
        payload: randomMap,
      );
    });
  }

  void readData() async {
    await dataHandler.fetchAndSaveData();
  }

  void listenNotifications() {
    _notificationSubscription =
        NotificationApi.onNotifications.stream.listen(onClickedNotification);
  }

  void onClickedNotification(String? payload) {
    debugPrint('GO to: $payload');
    if (!mounted) return;
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const RadarScreen(),
      settings: RouteSettings(
        arguments: payload,
      ),
    ));
  }

  @override
  void dispose() {
    _notificationSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final radarViewModel = Provider.of<RadarViewModel>(context);
    final utilViewModel = Provider.of<UtilViewModel>(context);

    return Scaffold(
      backgroundColor: Global.bgColor,
      appBar: AppBar(
        leading: Image.asset(
          'assets/icons/Logo.png',
        ),
        title: Text(
          'Maps',
          style: TextStyle(
            fontSize: context.font26,
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'Menu',
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
              size: context.iconSize24,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: Global.maps.length,
        itemBuilder: (BuildContext context, int index) {
          return Semantics(
            button: true,
            label: 'Open map ${Global.maps[index]}',
            child: GestureDetector(
              onTap: () async {
                radarViewModel.reset();
                utilViewModel.reset();
                utilViewModel.toggleUtil(UtilType.smoke, Team.t);
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
                height: context.height20 * 8,
                margin: EdgeInsets.all(context.height10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(context.radius28),
                  image: DecorationImage(
                    colorFilter: const ColorFilter.mode(
                        Colors.black38, BlendMode.overlay),
                    image: AssetImage(
                        'assets/img/maps/CS2_${Global.maps[index].toLowerCase()}_map.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: BorderedText(
                    strokeWidth: context.stroke4,
                    strokeColor: Colors.black,
                    child: Text(
                      Global.maps[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: context.font48,
                        fontWeight: FontWeight.w700,
                      ),
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
