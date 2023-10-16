import 'package:cs_smoke_app/core/models/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/viewmodels/settings_view_model.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsViewModel settingsViewModel =
        Provider.of<SettingsViewModel>(context);
    return Scaffold(
      appBar: AppBar(),
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

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
  });

  final VoidCallback onTap;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 62,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey.shade800, // Mørkegrå farve
            border: Border.all(
              color: Colors.grey.shade600, // Lidt lysere grå border
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              Icon(
                icon,
                color: Colors.white,
                size: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
