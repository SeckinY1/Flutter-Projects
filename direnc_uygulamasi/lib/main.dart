import 'package:direnc_uygulamasi/home_page.dart';
import 'package:direnc_uygulamasi/service/ad_mob_service.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  BannerAd? _banner;
  @override
  void initState() {
    super.initState();
    _createBannerAd();
  }

  void _createBannerAd() {
    _banner = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: AdMobService.bannerAdUnitId!,
      listener: AdMobService.bannerListener,
      request: const AdRequest(),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: const HomePage(),
          bottomNavigationBar: _banner == null
              ? Container(
                  color: Colors.amber,
                )
              : Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  height: 52,
                  child: AdWidget(
                    ad: _banner!,
                  ),
                )),
    );
  }
}
