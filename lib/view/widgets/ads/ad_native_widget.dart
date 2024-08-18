import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class adNativeWidget extends StatelessWidget {
  const adNativeWidget({
    Key? key,
    required NativeAd? nativeAd,
  })  : _nativeAd = nativeAd,
        super(key: key);

  final NativeAd? _nativeAd;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 320, // minimum recommended width
        minHeight: 320, // minimum recommended height
        maxWidth: 400,
        maxHeight: 400,
      ),
      child: AdWidget(ad: _nativeAd!),
    );
  }
}
