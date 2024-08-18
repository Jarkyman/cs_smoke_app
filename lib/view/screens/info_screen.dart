import 'dart:developer';

import 'package:cs_smoke_app/core/models/info_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../core/helper/ad_helper.dart';
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
  late NativeAd _nativeAd;
  bool _nativeAdIsLoaded = false;

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
        color: 'black',
        mute: true,
        showFullscreenButton: true,
        loop: true,
        strictRelatedVideos: true,
      ),
    );

    _controller.setFullScreenListener(
      (isFullScreen) {
        log('${isFullScreen ? 'Entered' : 'Exited'} Fullscreen.');
      },
    );

    _controller.loadVideoById(videoId: '');
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _nativeAd.dispose();
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
          // Dispose the ad here to free resources.
          debugPrint('$NativeAd failed to load: $error');
          ad.dispose();
        },
      ),
      request: AdRequest(),
      // Styling
      nativeTemplateStyle: NativeTemplateStyle(
          // Required: Choose a template.
          templateType: TemplateType.medium,
          // Optional: Customize the ad's style.
          cornerRadius: 10.0),
    );

    _nativeAd.load();
  }

  @override
  Widget build(BuildContext context) {
    final info = ModalRoute.of(context)!.settings.arguments as InfoModel;
    final utilViewModel = Provider.of<UtilViewModel>(context);
    _controller.loadVideoById(videoId: info.videoId);

    return YoutubePlayerScaffold(
      controller: _controller,
      builder: (context, player) {
        return Scaffold(
          backgroundColor: Global.bgColor,
          floatingActionButton: FloatingShareButton(
            onTap: () async {
              String url = "https://www.youtube.com/watch?v=${info.videoId}";
              if (url.isNotEmpty) {
                print("url = " + url);
                await Share.share(
                    "Hey, I came across this amazing ${utilViewModel.selectedUtil!.name} guide on Util Master! Check it out:\n\n$url");
              }
            },
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
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
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      player,
                      const YoutubeVideoPositionIndicator(),
                      const YoutubeControls(),
                      FutureBuilder(
                        builder: (context, snapshot) {
                          return _nativeAdIsLoaded
                              ? ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    minWidth: 320, // minimum recommended width
                                    minHeight:
                                        320, // minimum recommended height
                                    maxWidth: 400,
                                    maxHeight: 400,
                                  ),
                                  child: AdWidget(ad: _nativeAd),
                                )
                              : Container();
                        },
                        future: Future(() async {
                          return Future.doWhile(() =>
                              Future.delayed(Duration(milliseconds: 10))
                                  .then((_) => !_nativeAdIsLoaded));
                        }),
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
        );
      },
    );
  }
}
