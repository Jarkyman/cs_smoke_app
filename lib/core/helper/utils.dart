import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Future openLink({
    required String url,
  }) =>
      _launchWebOrYoutubeUrl(url);

  static Future openEmail({
    required String toEmail,
    required String subject,
    required String body,
  }) async {
    final url =
        'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(body)}';

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  static Future openPhoneCall({required String phoneNumber}) async {
    final url = 'tel:$phoneNumber';

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  static Future openSMS({required String phoneNumber}) async {
    final url = 'sms:$phoneNumber';

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  static Future _launchWebOrYoutubeUrl(String url) async {
    if (Platform.isIOS) {
      if (await canLaunchUrl(Uri.parse('youtube://$url'))) {
        await launchUrl(Uri.parse('youtube://$url'));
      } else {
        if (await canLaunchUrl(Uri.parse('https://$url'))) {
          await launchUrl(Uri.parse('https://$url'));
        } else {
          //TODO: Error code for failed youtube open on iOS
        }
      }
    } else {
      if (await canLaunchUrl(Uri.parse('https://$url'))) {
        await launchUrl(Uri.parse('https://$url'));
      } else {
        //TODO: Error code for failed youtube open app on Android
      }
    }
  }
}
