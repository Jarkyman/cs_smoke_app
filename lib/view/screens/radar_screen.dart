import 'package:cs_smoke_app/core/helper/dimensions.dart';
import 'package:cs_smoke_app/view/shared/global.dart';
import 'package:cs_smoke_app/view/widgets/buttons/floating_show_name_button.dart';
import 'package:cs_smoke_app/view/widgets/raw_gesture_detector_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import '../../core/helper/ad_helper.dart';
import '../../core/viewmodels/util_view_model.dart';
import '../widgets/ads/ad_banner_widget.dart';
import '../widgets/appbar/app_bar_widget.dart';
import '../widgets/buttons/icon_button_close.dart';
import '../widgets/buttons/rectangle_button.dart';
import '../widgets/grid_view_widget.dart';

class RadarScreen extends StatefulWidget {
  const RadarScreen({super.key});

  @override
  State<RadarScreen> createState() => _RadarScreenState();
}

class _RadarScreenState extends State<RadarScreen> {
  BannerAd? _bannerAd;
  int bannerHeight = 0;

  @override
  void initState() {
    super.initState();
    createBannerAd();
  }

  void dispose() {
    super.dispose();
    _bannerAd?.dispose();
  }

  void createBannerAd() {
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
            if (_bannerAd != null) {
              bannerHeight = _bannerAd!.size.height;
            }
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          ad.dispose();
          bannerHeight = 0;
        },
      ),
    ).load();
  }

  @override
  Widget build(BuildContext context) {
    final utilViewModel = Provider.of<UtilViewModel>(context);
    final String mapName =
        ModalRoute.of(context)!.settings.arguments as String ?? '';

    return Scaffold(
      floatingActionButton: FloatingShowNameButton(
        onTap: () {
          utilViewModel.toggleShowName();
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                AppBarWidget(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedContainer(
                    duration: Duration(
                        milliseconds: 500), // Angiv varigheden af animationen
                    curve: Curves.easeInOut, // Kurven for animationen
                    height: utilViewModel.showNames
                        ? Dimensions.screenHeight - bannerHeight
                        : Dimensions.screenHeight -
                            (Dimensions.height20 * 10) -
                            bannerHeight, // Højden vil variere mellem disse to værdier
                    // Indsæt andre nødvendige egenskaber for containeren
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius20 * 2),
                        topRight: Radius.circular(Dimensions.radius20 * 2),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            color: Global.bgColor,
                            child: Center(
                              child: RawGestureDetectorWidget(
                                child: GridViewWidget(
                                  mapName: mapName,
                                ),
                              ),
                            ),
                          ),
                          SafeArea(
                            child: utilViewModel.isUtilSelected
                                ? IconButtonClose(
                                    onTap: () {
                                      utilViewModel.reset();
                                    },
                                  )
                                : RectangleButton(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    text: 'Go Back',
                                  ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          _bannerAd != null ? adBannerWidget(bannerAd: _bannerAd) : Container(),
        ],
      ),
    );
  }
}
