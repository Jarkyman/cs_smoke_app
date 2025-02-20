import 'dart:io';

import 'package:cs_smoke_app/core/helper/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launch_store/flutter_launch_store.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/helper/constants.dart';
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
                    'Hey there! I just discovered this amazing app, Util Master, that helps improve your CS2 skills. \n\nCheck it out here: http://utilmaster.wuaze.com/app');
              },
              title: 'Share app',
              icon: Icons.share_outlined,
            ),
            MenuButton(
              onTap: () {
                print('app id: ${Constants.IOS_ID}');
                try {
                  if (Platform.isIOS) {
                    StoreLauncher.openWithStore(Constants.IOS_ID).catchError((e) {
                      print('ERROR opening iOS App Store: $e');
                    });
                  } else if (Platform.isAndroid) {
                    StoreLauncher.openWithStore(Constants.ANDROID_ID).catchError((e) {
                      print('ERROR opening Android Play Store: $e');
                    });
                  } else {
                    print('Unsupported platform');
                  }
                } catch (e) {
                  print('An unexpected error occurred: $e');
                }
              },
              title: 'Rate app',
              icon: Icons.star_border_outlined,
            ),
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
