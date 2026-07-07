import 'package:url_launcher/url_launcher.dart';

class Utils {
  static const _videoHosts = [
    'youtube.com',
    'youtu.be',
    'instagram.com',
    'tiktok.com',
  ];

  static Future openLink({
    required String url,
  }) async {
    final uri = _normalizeWebUri(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      // Fallback or error handling
    }
  }

  static Future openVideoLink({
    required String url,
  }) async {
    final uri = _normalizeWebUri(url);
    if (!_isKnownVideoHost(uri)) {
      await openLink(url: url);
      return;
    }

    final openedNative = await launchUrl(
      uri,
      mode: LaunchMode.externalNonBrowserApplication,
    );
    if (!openedNative) {
      await openLink(url: url);
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

  static Uri _normalizeWebUri(String url) {
    if (url.startsWith('http://') || url.startsWith('https://')) {
      return Uri.parse(url);
    }
    return Uri.parse('https://$url');
  }

  static bool _isKnownVideoHost(Uri uri) {
    final host = uri.host.toLowerCase();
    return _videoHosts.any((videoHost) {
      return host == videoHost || host.endsWith('.$videoHost');
    });
  }
}
