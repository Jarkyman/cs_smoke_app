import 'dart:convert';

import 'package:flutter/material.dart';

import '../../core/helper/analytics_helper.dart';
import '../../core/helper/utils.dart';
import '../../core/models/sponsor_model.dart';
import '../shared/global.dart';

class SponsorAdCard extends StatefulWidget {
  const SponsorAdCard({
    super.key,
    required this.sponsor,
    required this.placement,
    required this.appId,
    this.maxHeight,
  });

  final SponsorModel sponsor;
  final String placement;
  final String appId;
  final double? maxHeight;

  @override
  State<SponsorAdCard> createState() => _SponsorAdCardState();
}

class _SponsorAdCardState extends State<SponsorAdCard> {
  bool _impressionLogged = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_impressionLogged) return;
    _impressionLogged = true;
    debugPrint(
      'Sponsor ad shown: ${jsonEncode(widget.sponsor.toLogJson(
        placement: widget.placement,
        appId: widget.appId,
      ))}',
    );
    AnalyticsHelper.logSponsorImpression(
      sponsorId: widget.sponsor.id,
      placement: widget.placement,
      appId: widget.appId,
      campaignTitle: widget.sponsor.title,
    );
  }

  @override
  Widget build(BuildContext context) {
    final maxHeight = widget.maxHeight;
    final isCompact = maxHeight != null && maxHeight < 300;
    final verticalMargin = isCompact ? 8.0 : 18.0;
    final horizontalMargin = isCompact ? 12.0 : 16.0;
    final horizontalPadding = isCompact ? 12.0 : 16.0;
    final verticalPadding = isCompact ? 10.0 : 14.0;
    final imageHeight = maxHeight == null
        ? null
        : (maxHeight * (isCompact ? 0.36 : 0.46)).clamp(82.0, 220.0);

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 450,
          maxHeight: maxHeight ?? double.infinity,
        ),
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: horizontalMargin,
            vertical: verticalMargin,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF0C1024),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: _openSponsor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _SponsorImage(
                  imageUrl: widget.sponsor.imageUrl,
                  height: imageHeight,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    horizontalPadding,
                    verticalPadding,
                    horizontalPadding,
                    verticalPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Sponsored',
                        style: TextStyle(
                          color: Color(0xFF7D8BFF),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        widget.sponsor.title,
                        maxLines: isCompact ? 1 : 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isCompact ? 15 : 17,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: isCompact ? 4 : 6),
                      Text(
                        widget.sponsor.description,
                        maxLines: isCompact ? 2 : 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.72),
                          fontSize: isCompact ? 12 : 14,
                          height: isCompact ? 1.25 : 1.35,
                        ),
                      ),
                      SizedBox(height: isCompact ? 8 : 14),
                      _SponsorButton(
                        text: widget.sponsor.ctaText,
                        height: isCompact ? 36 : 44,
                        fontSize: isCompact ? 13 : 14,
                      ),
                    ],
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
      placement: widget.placement,
      appId: widget.appId,
      campaignTitle: widget.sponsor.title,
    );
    await Utils.openLink(url: widget.sponsor.clickUrl);
  }
}

class _SponsorImage extends StatelessWidget {
  const _SponsorImage({
    required this.imageUrl,
    required this.height,
  });

  final String imageUrl;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final image = Image.network(
      imageUrl,
      height: height,
      width: double.infinity,
      fit: BoxFit.contain,
      errorBuilder: (_, __, ___) => Container(
        height: height,
        color: Global.blue.withValues(alpha: 0.16),
        child: const Icon(
          Icons.campaign_outlined,
          color: Colors.white70,
          size: 48,
        ),
      ),
    );

    if (height != null) {
      return Container(
        height: height,
        color: Colors.black.withValues(alpha: 0.18),
        child: image,
      );
    }

    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        color: Colors.black.withValues(alpha: 0.18),
        child: image,
      ),
    );
  }
}

class _SponsorButton extends StatelessWidget {
  const _SponsorButton({
    required this.text,
    required this.height,
    required this.fontSize,
  });

  final String text;
  final double height;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Global.blue.withValues(alpha: 0.88),
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        height: height,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
