import 'package:cs_smoke_app/core/helper/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/helper/dimensions.dart';
import '../../core/viewmodels/settings_view_model.dart';
import '../widgets/buttons/menu_button.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsViewModel settingsViewModel =
        Provider.of<SettingsViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
          iconSize: Dimensions.iconSize24,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            MenuButton(
              onTap: () {
                settingsViewModel.toggleNotification();
              },
              title: 'Notifications',
              icon: settingsViewModel.isNotification
                  ? Icons.check_box_outlined
                  : Icons.check_box_outline_blank_outlined,
            ),
            /*MenuButton(
              onTap: () {
                print('Click');
                Random random = Random();
    String randomMap = Global.maps[random.nextInt(Global.maps.length)];
    NotificationApi.showScheduledNotification(
      title: 'Go practice now',
      body: 'Check out this new smokes on $randomMap',
      payload: randomMap,
      scheduledDate: DateTime.now().add(Duration(seconds: 10)), //Test
    );
              },
              title: 'Test notification',
              icon: Icons.access_alarm,
            ),*/ //Test only
            MenuButton(
              onTap: () {
                Share.share(
                    'Check out this app \nhttp://Utilmaster.epizy.com/app');
              },
              title: 'Share app',
              icon: Icons.share_outlined,
            ), //TODO: Link virker ikke endu, siden skal først laves
            /*MenuButton(
              onTap: () {
                LaunchReview.launch(
                  androidAppId: '',
                  iOSAppId: ''
                );
              },
              title: 'Rate app',
              icon: Icons.star_border_outlined,
            ),*/ //TODO: add review for ios and android
            MenuButton(
              onTap: () async {
                Utils.openLink(url: 'www.youtube.com/@UtilMaster');
              },
              title: 'Visit YouTube',
              icon: Icons.ondemand_video_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
