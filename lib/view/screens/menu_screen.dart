import 'package:cs_smoke_app/core/helper/utils.dart';
import 'package:cs_smoke_app/view/screens/create_pin_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cs_smoke_app/l10n/app_localizations.dart';

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
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: 'Back',
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CreatePinScreen(),
                  ),
                );
              },
              title: l10n.createPin,
              icon: Icons.add_location_alt_outlined,
            ),
            MenuButton(
              onTap: () {
                settingsViewModel.toggleNotification();
              },
              title: l10n.notifications,
              icon: settingsViewModel.isNotification
                  ? Icons.check_box_outlined
                  : Icons.check_box_outline_blank_outlined,
            ),
            MenuButton(
              onTap: () {
                _showLanguagePicker(context, settingsViewModel);
              },
              title: l10n.language,
              icon: Icons.language_outlined,
            ),
            MenuButton(
              onTap: () {
                final shareUrl = Constants.shareAppUrl;
                SharePlus.instance.share(ShareParams(
                    text: l10n.shareText(shareUrl)));
              },
              title: l10n.shareApp,
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
              title: l10n.rateApp,
              icon: Icons.star_border_outlined,
            ),
            MenuButton(
              onTap: () async {
                Utils.openLink(url: 'www.youtube.com/@UtilMaster');
              },
              title: l10n.visitYoutube,
              icon: Icons.ondemand_video_outlined,
            ),
          ],
        ),
      ),
    );
  }

  void _showLanguagePicker(BuildContext context, SettingsViewModel settingsViewModel) {
    final Map<String, String> languages = {
      'en': 'English',
      'da': 'Dansk',
      'ru': 'Русский',
      'tr': 'Türkçe',
      'pt': 'Português',
      'zh': '中文',
      'es': 'Español',
      'de': 'Deutsch',
      'pl': 'Polski',
      'sv': 'Svenska',
      'no': 'Norsk',
      'fi': 'Suomi',
      'mn': 'Монгол',
      'ro': 'Română',
      'fr': 'Français',
      'ja': '日本語',
      'uk': 'Українська',
    };

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: context.height20),
          child: ListView.builder(
            itemCount: languages.length,
            itemBuilder: (context, index) {
              final code = languages.keys.elementAt(index);
              final name = languages.values.elementAt(index);
              final isSelected = settingsViewModel.locale?.languageCode == code || 
                (settingsViewModel.locale == null && Localizations.localeOf(context).languageCode == code);
              
              return ListTile(
                title: Text(name),
                trailing: isSelected ? const Icon(Icons.check, color: Colors.blue) : null,
                onTap: () {
                  settingsViewModel.setLocale(Locale(code));
                  Navigator.pop(context);
                },
              );
            },
          ),
        );
      },
    );
  }
}
