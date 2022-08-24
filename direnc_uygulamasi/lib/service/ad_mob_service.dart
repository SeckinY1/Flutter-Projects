import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService {
  static String? get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-9897893205846439/3283764883";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544~3347511713";
    }
    return null;
  }

  static final BannerAdListener bannerListener = BannerAdListener(
    onAdLoaded: (ad) => debugPrint("Ad Loaded"),
    onAdFailedToLoad: (ad, error) {
      ad.dispose();
      debugPrint("Ad failed to load: $error");
    },
    onAdOpened: (ad) => debugPrint("Ad Opened"),
    onAdClosed: (ad) => debugPrint("Ad Closed"),
  );
}
