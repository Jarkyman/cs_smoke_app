import 'package:cs_smoke_app/core/models/info_model.dart';
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
  String? _loadedVideoId;

  @override
  void initState() {
    loadNativeAd();
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
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final info = ModalRoute.of(context)?.settings.arguments as InfoModel?;
    if (info != null) {
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
    printLog();
    _controller.close();
    super.dispose();
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
      // Styling
      nativeTemplateStyle: NativeTemplateStyle(
          // Required: Choose a template.
          templateType: TemplateType.medium,
          // Optional: Customize the ad's style.
          cornerRadius: 10.0),
    );

    _nativeAd?.load();
  }

  @override
  Widget build(BuildContext context) {
    final utilViewModel = Provider.of<UtilViewModel>(context);

    return YoutubePlayerControllerProvider(
      controller: _controller,
      child: Scaffold(
        backgroundColor: Global.bgColor,
        floatingActionButton: FloatingShareButton(
          onTap: () async {
            final info =
                ModalRoute.of(context)?.settings.arguments as InfoModel?;
            if (info != null) {
              String url = "https://www.youtube.com/watch?v=${info.videoId}";
              if (url.isNotEmpty) {
                debugPrint("url = $url");
                await SharePlus.instance.share(ShareParams(
                    text:
                        "Hey, I came across this amazing ${utilViewModel.selectedUtil!.name} guide on Util Master! Check it out:\n\n$url"));
              }
            }
          },
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final player = YoutubePlayer(controller: _controller);
            if (kIsWeb && constraints.maxWidth > 750) {
              //TODO: if web is wanted, this need a fix and mission buttons.
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
                  const Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                      child: YoutubeControls(),
                    ),
                  ),
                ],
              );
            }

            return Stack(
              children: [
                ListView(
                  children: [
                    player,
                    const YoutubeVideoPositionIndicator(),
                    const YoutubeControls(),
                    Builder(
                      builder: (context) {
                        final currentAd = _nativeAd;
                        if (_nativeAdIsLoaded && currentAd != null) {
                          return Align(
                            alignment: Alignment.center,
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                minWidth: 300,
                                minHeight: 350,
                                maxHeight: 400,
                                maxWidth: 450,
                              ),
                              child: AdWidget(ad: currentAd),
                            ),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    )
                  ],
                ),
                SafeArea(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RectangleButton(
                      onTap: () {
                        Navigator.pop(context);
                        Review.checkReviewPopup(context);
                      },
                      text: 'Go Back',
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

  void _loadVideoIfNeeded(String videoId) {
    if (videoId.isEmpty || _loadedVideoId == videoId) {
      return;
    }
    _controller.loadVideoById(videoId: videoId);
    _loadedVideoId = videoId;
  }
}
