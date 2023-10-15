import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Future openLink({
    required String url,
  }) =>
      _launchUrl(url);

  static Future openEmail({
    required String toEmail,
    required String subject,
    required String body,
  }) async {
    final url =
        'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(body)}';

    await _launchUrl(url);
  }

  static Future openPhoneCall({required String phoneNumber}) async {
    final url = 'tel:$phoneNumber';

    await _launchUrl(url);
  }

  static Future openSMS({required String phoneNumber}) async {
    final url = 'sms:$phoneNumber';

    await _launchUrl(url);
  }

  static Future _launchUrl(String url) async {
    https: //
    if (Platform.isIOS) {
      if (await canLaunchUrl(Uri.parse('youtube://' + url)) && Platform.isIOS) {
        await launchUrl(Uri.parse('youtube://' + url));
        //TODO: Check that youtube app opens works on a device with youtube
      } else {
        if (await canLaunchUrl(Uri.parse('https://' + url))) {
          await launchUrl(Uri.parse('https://' + url));
        } else {
          //TODO: Error code for failed youtube open on iOS
        }
      }
    } else {
      if (await canLaunchUrl(Uri.parse('https://' + url))) {
        await launchUrl(Uri.parse('https://' + url));
      } else {
        //TODO: Error code for failed youtube open app on Android
      }
    }
  }
}
