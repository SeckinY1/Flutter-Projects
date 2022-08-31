import 'dart:io';

import 'package:direnc_uygulamasi/screens/alti_bant_hesaplama.dart';
import 'package:direnc_uygulamasi/screens/bes_bant_hesaplama.dart';
import 'package:direnc_uygulamasi/screens/dort_bant_hesaplama.dart';
import 'package:direnc_uygulamasi/screens/uc_bant_hesaplama.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BannerAd myBanner = BannerAd(
    adUnitId:
        Platform.isAndroid ? 'ca-app-pub-3940256099942544/6300978111' : "",
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(),
  );

  @override
  void initState() {
    super.initState();
    myBanner.load();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/background.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          children: [
            Expanded(
                child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: size.height * 0.4,
                  width: size.width,
                  child: const Text(
                      "DİRENÇ HESAPLAMA UYGULAMASINA \n HOŞ GELDİNİZ \n\n  HESAPLAMAK İSTEDİĞİNİZ BANDI \n SEÇİNİZ",
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 1.5,
                        color: Colors.white,
                        fontFamily: "Poppins",
                      ),
                      textAlign: TextAlign.center),
                ),
                Expanded(
                  child: Container(
                    width: size.width,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                        )),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 35,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          height: size.height * 0.075,
                          width: size.width * 0.65,
                          child: ElevatedButon(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const UcBantHesaplama()));
                              },
                              text: "Üç Bant Direnç Hesaplama"),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          height: size.height * 0.075,
                          width: size.width * 0.65,
                          child: ElevatedButon(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DortBantHesaplama()));
                              },
                              text: "Dört Bant Direnç Hesaplama"),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          height: size.height * 0.075,
                          width: size.width * 0.65,
                          child: ElevatedButon(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const BesBantHesaplama()));
                              },
                              text: "Beş Bant Direnç Hesaplama"),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          height: size.height * 0.075,
                          width: size.width * 0.65,
                          child: ElevatedButon(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AltiBantHesaplama()));
                              },
                              text: "Altı Bant Direnç Hesaplama"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
            Container(
              alignment: Alignment.center,
              width: myBanner.size.width.toDouble(),
              height: myBanner.size.height.toDouble(),
              child: AdWidget(ad: myBanner),
            )
          ],
        ),
      ]),
    );
  }
}

class ElevatedButon extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const ElevatedButon({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: "Poppins",
        ),
      ),
      style: ElevatedButton.styleFrom(
          primary: const Color.fromRGBO(55, 162, 149, 1),
          fixedSize: const Size(210, 30)),
    );
  }
}
