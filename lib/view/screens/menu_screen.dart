import 'package:cs_smoke_app/core/helper/utils.dart';
import 'package:flutter/foundation.dart';
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
          iconSize: context.iconSize24,
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
            MenuButton(
              onTap: () {
                final shareUrl = Constants.shareAppUrl;
                SharePlus.instance.share(ShareParams(
                    text:
                        'Hey there! I just discovered this amazing app, Util Master, that helps improve your CS2 skills. \n\nCheck it out here: $shareUrl'));
              },
              title: 'Share app',
              icon: Icons.share_outlined,
            ),
            MenuButton(
              onTap: () {
                debugPrint('app id: ${Constants.iosId}');
                try {
                  if (defaultTargetPlatform == TargetPlatform.iOS) {
                    StoreLauncher.openWithStore(Constants.iosId)
                        .catchError((e) {
                      debugPrint('ERROR opening iOS App Store: $e');
                    });
                  } else if (defaultTargetPlatform == TargetPlatform.android) {
                    StoreLauncher.openWithStore(Constants.androidId)
                        .catchError((e) {
                      debugPrint('ERROR opening Android Play Store: $e');
                    });
                  } else {
                    debugPrint('Unsupported platform');
                  }
                } catch (e) {
                  debugPrint('An unexpected error occurred: $e');
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
