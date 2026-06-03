import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Future openLink({
    required String url,
  }) async {
    Uri uri;
    if (url.startsWith('http://') || url.startsWith('https://')) {
      uri = Uri.parse(url);
    } else {
      uri = Uri.parse('https://$url');
    }

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      // Fallback or error handling
    }
  }

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

}
