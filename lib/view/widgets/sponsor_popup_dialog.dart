import 'dart:convert';

import 'package:flutter/material.dart';

import '../../core/helper/analytics_helper.dart';
import '../../core/helper/utils.dart';
import '../../core/models/sponsor_model.dart';
import '../shared/global.dart';

class SponsorPopupDialog extends StatefulWidget {
  const SponsorPopupDialog({
    super.key,
    required this.sponsor,
    required this.appId,
  });

  final SponsorModel sponsor;
  final String appId;

  static Future<void> show({
    required BuildContext context,
    required SponsorModel sponsor,
    required String appId,
  }) {
    return showDialog<void>(
      context: context,
      builder: (_) => SponsorPopupDialog(
        sponsor: sponsor,
        appId: appId,
      ),
    );
  }

  @override
  State<SponsorPopupDialog> createState() => _SponsorPopupDialogState();
}

class _SponsorPopupDialogState extends State<SponsorPopupDialog> {
  bool _impressionLogged = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_impressionLogged) return;
    _impressionLogged = true;
    debugPrint(
      'Sponsor ad shown: ${jsonEncode(widget.sponsor.toLogJson(
        placement: 'startup_popup',
        appId: widget.appId,
      ))}',
    );
    AnalyticsHelper.logSponsorImpression(
      sponsorId: widget.sponsor.id,
      placement: 'startup_popup',
      appId: widget.appId,
      campaignTitle: widget.sponsor.title,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Global.bgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 380),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Sponsored',
                        style: TextStyle(
                          color: Color(0xFF7D8BFF),
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    IconButton(
                      tooltip: 'Close',
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close, color: Colors.white70),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      color: Colors.black.withValues(alpha: 0.18),
                      child: Image.network(
                        widget.sponsor.imageUrl,
                        fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) => Container(
                          color: Global.blue.withValues(alpha: 0.16),
                          child: const Icon(
                            Icons.campaign_outlined,
                            color: Colors.white70,
                            size: 48,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  widget.sponsor.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.sponsor.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.72),
                    fontSize: 15,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _openSponsor,
                    style: FilledButton.styleFrom(
                      backgroundColor: Global.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      widget.sponsor.ctaText,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _openSponsor() async {
    await AnalyticsHelper.logSponsorClick(
      sponsorId: widget.sponsor.id,
      placement: 'startup_popup',
      appId: widget.appId,
      campaignTitle: widget.sponsor.title,
    );
    if (!mounted) return;
    Navigator.of(context).pop();
    await Utils.openLink(url: widget.sponsor.clickUrl);
  }
}
