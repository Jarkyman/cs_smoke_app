import 'package:cs_smoke_app/core/helper/dimensions.dart';
import 'package:cs_smoke_app/core/helper/utils.dart';
import 'package:cs_smoke_app/core/models/info_model.dart';
import 'package:cs_smoke_app/core/models/sponsor_model.dart';
import 'package:cs_smoke_app/core/viewmodels/sponsor_view_model.dart';
import 'package:cs_smoke_app/core/viewmodels/user_util_view_model.dart';
import 'package:cs_smoke_app/l10n/app_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../core/helper/ad_helper.dart';
import '../../core/helper/analytics_helper.dart';
import '../../core/helper/review.dart';
import '../../core/viewmodels/util_view_model.dart';
import '../shared/global.dart';
import '../widgets/buttons/floating_share_button.dart';
import '../widgets/buttons/rectangle_button.dart';
import '../widgets/sponsor_ad_card.dart';
import '../widgets/youtube/youtube_controls.dart';
import '../widgets/youtube/youtube_video_position_indicator.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  late YoutubePlayerController _controller;
  NativeAd? _nativeAd;
  bool _nativeAdIsLoaded = false;
  SponsorModel? _sponsorAd;
  String _sponsorAppId = SponsorViewModel.defaultAppId;
  String? _loadedVideoId;

  InfoModel? _cachedInfo;

  InfoModel? get _info => _cachedInfo;

  bool get _isUserCreated => _info?.isUserCreated ?? false;
  bool get _isYoutube =>
      _info?.videoUrl == null && _info?.videoId.isNotEmpty == true;

  bool _adLoadedAttempted = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
          showControls: true,
          enableCaption: false,
          showVideoAnnotations: false,
          color: 'black',
          mute: true,
          showFullscreenButton: true,
          loop: true,
          strictRelatedVideos: true,
          origin: 'https://www.youtube-nocookie.com'),
    );

    _controller.setFullScreenListener(
      (isFullScreen) {
        debugPrint('${isFullScreen ? 'Entered' : 'Exited'} Fullscreen.');
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cachedInfo = ModalRoute.of(context)?.settings.arguments as InfoModel?;
    if (!_adLoadedAttempted) {
      _adLoadedAttempted = true;
      loadAdSlot();
    }
    final info = _info;
    if (info != null && _isYoutube) {
      _loadVideoIfNeeded(info.videoId);
    }
  }

  void printLog() async {
    String url = await _controller.videoEmbedCode;
    debugPrint("VIDEO: $url");
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _nativeAd?.dispose();
    if (_isYoutube) printLog();
    _controller.close();
    super.dispose();
  }

  Future<void> loadAdSlot() async {
    final sponsorViewModel =
        Provider.of<SponsorViewModel>(context, listen: false);
    _sponsorAppId = sponsorViewModel.appId;
    final sponsor = await sponsorViewModel.pickVideoSponsorForAdSlot();
    if (!mounted) return;

    if (sponsor != null) {
      setState(() {
        _sponsorAd = sponsor;
      });
      return;
    }

    loadNativeAd();
  }

  void loadNativeAd() {
    _nativeAd = NativeAd(
      adUnitId: AdHelper.nativeAdUnitId,
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          debugPrint('$NativeAd loaded.');
          setState(() {
            _nativeAdIsLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint('$NativeAd failed to load: $error');
          ad.dispose();
          _nativeAd = null;
        },
        onAdClicked: (_) {
          AnalyticsHelper.logNativeAdClicked();
        },
      ),
      request: const AdRequest(),
      nativeTemplateStyle: NativeTemplateStyle(
          templateType: TemplateType.medium, cornerRadius: 10.0),
    );

    _nativeAd?.load();
  }

  @override
  Widget build(BuildContext context) {
    final info = _info;
    final utilViewModel = Provider.of<UtilViewModel>(context);
    final l10n = AppLocalizations.of(context)!;

    return YoutubePlayerControllerProvider(
      controller: _controller,
      child: Scaffold(
        backgroundColor: Global.bgColor,
        floatingActionButton: FloatingShareButton(
          onTap: () async {
            if (info != null) {
              String url = "";
              if (_isYoutube && info.videoId.isNotEmpty) {
                url = "https://www.youtube.com/watch?v=${info.videoId}";
              } else if (!_isYoutube && info.videoUrl != null) {
                url = info.videoUrl!;
              }

              if (url.isNotEmpty) {
                debugPrint("url = $url");
                await SharePlus.instance.share(ShareParams(
                    text:
                        "Hey, I came across this amazing ${utilViewModel.selectedUtil?.name ?? 'utility'} guide on Util Master! Check it out:\n\n$url"));
              }
            }
          },
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            // ----- Non-YouTube (Instagram / TikTok / other) -----
            if (!_isYoutube) {
              return _buildExternalVideoView(context, info, l10n);
            }

            // ----- YouTube -----
            final player = YoutubePlayer(controller: _controller);
            if (kIsWeb && constraints.maxWidth > 750) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        player,
                        const YoutubeVideoPositionIndicator(),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          if (!_isUserCreated) const YoutubeControls(),
                          _buildAdSlot(),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }

            final userUtilVM =
                Provider.of<UserUtilViewModel>(context, listen: false);

            return Stack(
              children: [
                SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: context.height20 * 3.5),
                    child: Column(
                      children: [
                        player,
                        const YoutubeVideoPositionIndicator(),
                        if (!_isUserCreated) const YoutubeControls(),
                        if (_isUserCreated)
                          Padding(
                            padding: EdgeInsets.all(context.height20),
                            child: SizedBox(
                              width: double.infinity,
                              child: OutlinedButton.icon(
                                onPressed: () => _confirmDelete(
                                    context, l10n, userUtilVM, info),
                                icon: const Icon(Icons.delete_outline,
                                    color: Colors.redAccent),
                                label: Text(l10n.deletePin,
                                    style: const TextStyle(
                                        color: Colors.redAccent)),
                                style: OutlinedButton.styleFrom(
                                  side:
                                      const BorderSide(color: Colors.redAccent),
                                  padding: EdgeInsets.symmetric(
                                      vertical: context.height15),
                                ),
                              ),
                            ),
                          ),
                        Expanded(
                          child: LayoutBuilder(
                            builder: (context, adConstraints) {
                              return _buildAdSlot(
                                maxHeight: adConstraints.maxHeight,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SafeArea(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RectangleButton(
                      onTap: () {
                        Navigator.pop(context);
                        if (!_isUserCreated) Review.checkReviewPopup(context);
                      },
                      text: l10n.goBack,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  /// Shown when the video is not a YouTube embed (Instagram, TikTok, or other link).
  Widget _buildExternalVideoView(
    BuildContext context,
    InfoModel? info,
    AppLocalizations l10n,
  ) {
    final userUtilVM = Provider.of<UserUtilViewModel>(context, listen: false);

    String mapName = 'anubis';
    if (info?.userUtilId != null) {
      try {
        final util =
            userUtilVM.utils.firstWhere((u) => u.id == info!.userUtilId);
        mapName = util.location;
      } catch (_) {}
    }

    return Stack(
      children: [
        SafeArea(
          bottom: false,
          child: Padding(
            padding: EdgeInsets.only(bottom: context.height20 * 3.5),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    if (info?.videoUrl != null) {
                      Utils.openLink(url: info!.videoUrl!);
                    }
                  },
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          'assets/img/maps/CS2_${mapName.toLowerCase()}_map.png',
                          fit: BoxFit.cover,
                        ),
                        Container(color: Colors.black54),
                        Center(
                          child: Text(
                            l10n.openVideo,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: context.font26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Delete button (user-created pins only)
                if (_isUserCreated)
                  Padding(
                    padding: EdgeInsets.all(context.height20),
                    child: SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () =>
                            _confirmDelete(context, l10n, userUtilVM, info),
                        icon: const Icon(Icons.delete_outline,
                            color: Colors.redAccent),
                        label: Text(l10n.deletePin,
                            style: const TextStyle(color: Colors.redAccent)),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.redAccent),
                          padding:
                              EdgeInsets.symmetric(vertical: context.height15),
                        ),
                      ),
                    ),
                  ),

                Expanded(
                  child: LayoutBuilder(
                    builder: (context, adConstraints) {
                      return _buildAdSlot(
                        maxHeight: adConstraints.maxHeight,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: RectangleButton(
              onTap: () {
                Navigator.pop(context);
                if (!_isUserCreated) Review.checkReviewPopup(context);
              },
              text: l10n.goBack,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAdSlot({double? maxHeight}) {
    final sponsor = _sponsorAd;
    if (sponsor != null) {
      return SponsorAdCard(
        sponsor: sponsor,
        placement: 'video_page',
        appId: _sponsorAppId,
        maxHeight: maxHeight,
      );
    }

    final currentAd = _nativeAd;
    if (_nativeAdIsLoaded && currentAd != null) {
      final adHeight =
          maxHeight == null ? 350.0 : maxHeight.clamp(120.0, 350.0).toDouble();
      return Align(
        alignment: Alignment.center,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 300,
            minHeight: adHeight,
            maxHeight: adHeight,
            maxWidth: 450,
          ),
          child: AdWidget(ad: currentAd),
        ),
      );
    }

    return const SizedBox.shrink();
  }

  void _confirmDelete(
    BuildContext context,
    AppLocalizations l10n,
    UserUtilViewModel userUtilVM,
    InfoModel? info,
  ) {
    if (info == null) return;
    showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF1a1a2e),
        title: Text(l10n.confirmDelete,
            style: const TextStyle(color: Colors.white)),
        content: Text(l10n.confirmDeleteBody,
            style: const TextStyle(color: Colors.white70)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.confirmNo,
                style: const TextStyle(color: Colors.white54)),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context); // close dialog
              if (info.userUtilId != null && info.standIndex != null) {
                await userUtilVM.deleteStandFromUtil(
                    info.userUtilId!, info.standIndex!);
              }
              if (!context.mounted) return;
              Navigator.pop(context); // go back to radar
            },
            child:
                const Text('Delete', style: TextStyle(color: Colors.redAccent)),
          ),
        ],
      ),
    );
  }

  void _loadVideoIfNeeded(String videoId) {
    if (videoId.isEmpty || _loadedVideoId == videoId) {
      return;
    }
    _controller.loadVideoById(videoId: videoId);
    _loadedVideoId = videoId;
  }
}
