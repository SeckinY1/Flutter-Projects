import 'dart:io';
import 'dart:math';

import 'package:direnc_uygulamasi/wedgits/buttons/bant_secimi.dart';
import 'package:direnc_uygulamasi/wedgits/buttons/buton.dart';
import 'package:direnc_uygulamasi/wedgits/buttons/direnc_renkleri.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../wedgits/buttons/tolerans_renkleri.dart';

class DortBantHesaplama extends StatefulWidget {
  const DortBantHesaplama({Key? key}) : super(key: key);

  @override
  State<DortBantHesaplama> createState() => _DortBantHesaplamaState();
}

class _DortBantHesaplamaState extends State<DortBantHesaplama> {
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

  double? renkDegeri1;
  double? renkDegeri2;
  double? renkDegeri3;
  double? renkDegeri4;
  String? birim = "";
  String ifadeler = "± %";
  String deger = "... Ω ± % ...";
  String? toleransDegeri = "";
  double? sonuc;

  Map<String, double> renklerIlkBasamak = {
    "Kahverengi": 1,
    "Kırmızı": 2,
    "Turuncu": 3,
    "Sarı": 4,
    "Yeşil": 5,
    "Mavi": 6,
    "Mor": 7,
    "Gri": 8,
    "Beyaz": 9
  };
  Map<String, double> renkler = {
    "Siyah": 0,
    "Kahverengi": 1,
    "Kırmızı": 2,
    "Turuncu": 3,
    "Sarı": 4,
    "Yeşil": 5,
    "Mavi": 6,
    "Mor": 7,
    "Gri": 8,
    "Beyaz": 9
  };

  Map<String, double> carpan = {
    "Siyah": 0,
    "Kahverengi": 1,
    "Kırmızı": 2,
    "Turuncu": 3,
    "Sarı": 4,
    "Yeşil": 5,
    "Mavi": 6,
    "Mor": 7,
    "Altın": -1,
    "Gümüş": -2
  };

  Map<String, double> tolerans = {
    "Kahverengi": 1,
    "Kırmızı": 2,
    "Yeşil": 0.5,
    "Mavi": 0.25,
    "Mor": 0.10,
    "Gri": 0.05,
    "Altın": 5,
    "Gümüş": 10
  };

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 252, 83, 83),
        title: const Text(
          " Dört Bantlı Direnç Hesaplama",
          style: TextStyle(fontFamily: "Poppins"),
        ),
      ),
      body: Column(children: [
        Expanded(
            child: Column(
          children: [
            Container(
              height: size.height * 0.16,
              width: size.width * 0.76,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/direnc.png"))),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 115),
                  child: DirencRenkleri(
                      height: size.height * 0.060, renkDegeri: renkDegeri1),
                ),
                const SizedBox(
                  width: 10,
                ),
                DirencRenkleri(
                    height: size.height * 0.060, renkDegeri: renkDegeri2),
                const SizedBox(
                  width: 10,
                ),
                DirencRenkleri(
                    height: size.height * 0.060, renkDegeri: renkDegeri3),
                const SizedBox(
                  width: 10,
                ),
                ToleransRenkleri(
                    height: size.height * 0.060, renkDegeri: renkDegeri4)
              ]),
            ),
            SizedBox(
              height: size.height * 0.41,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BantSecimi(
                      bgColor: const Color.fromARGB(255, 236, 234, 234),
                      width: size.width * 0.76,
                      height: size.height * 0.07,
                      text: "Değer Seçiniz",
                      gelenRenkler: renklerIlkBasamak,
                      gelenRenkDegeri: renkDegeri1,
                      onPressed: (double? deger1) {
                        setState(() {
                          renkDegeri1 = deger1;
                        });
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  BantSecimi(
                      bgColor: const Color.fromARGB(255, 236, 234, 234),
                      width: size.width * 0.76,
                      height: size.height * 0.07,
                      text: "Değer Seçiniz",
                      gelenRenkler: renkler,
                      gelenRenkDegeri: renkDegeri2,
                      onPressed: (double? deger2) {
                        setState(() {
                          renkDegeri2 = deger2;
                        });
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  BantSecimi(
                      bgColor: const Color.fromARGB(255, 236, 234, 234),
                      width: size.width * 0.76,
                      height: size.height * 0.07,
                      text: "Değer Seçiniz",
                      gelenRenkler: carpan,
                      gelenRenkDegeri: renkDegeri3,
                      onPressed: (double? deger3) {
                        setState(() {
                          renkDegeri3 = deger3;
                        });
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  BantSecimi(
                      bgColor: const Color.fromARGB(255, 236, 234, 234),
                      width: size.width * 0.76,
                      height: size.height * 0.07,
                      text: "Değer Seçiniz",
                      gelenRenkler: tolerans,
                      gelenRenkDegeri: renkDegeri4,
                      onPressed: (double? deger4) {
                        setState(() {
                          renkDegeri4 = deger4;
                        });
                      }),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.13,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Buton(
                    renkDegeri1: renkDegeri1,
                    renkDegeri2: renkDegeri2,
                    renkDegeri3: renkDegeri3,
                    width: size.width * 0.25,
                    childDegeri: "Ω",
                    color: const Color.fromRGBO(255, 87, 87, 1),
                    onPressed: () {
                      setState(() {
                        if (renkDegeri1 == null ||
                            renkDegeri2 == null ||
                            renkDegeri3 == null ||
                            renkDegeri4 == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor:
                                      Color.fromRGBO(255, 87, 87, 1),
                                  content: Text(
                                    "Eksik veya hatalı ifade girişi yaptınız !",
                                    textAlign: TextAlign.center,
                                  )));
                        } else {
                          toleransDegeri = ifadeler + renkDegeri4.toString();
                          birim = "Ω";
                          sonuc = ((renkDegeri1! * 10) + renkDegeri2!) *
                              pow(10, renkDegeri3!).toDouble();
                          print(sonuc);
                          deger = sonuc.toString();
                        }
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Buton(
                    renkDegeri1: renkDegeri1,
                    renkDegeri2: renkDegeri2,
                    renkDegeri3: renkDegeri3,
                    renkDegeri4: renkDegeri4,
                    width: size.width * 0.25,
                    childDegeri: "kΩ",
                    color: const Color.fromRGBO(255, 87, 87, 1),
                    onPressed: () {
                      setState(() {
                        if (renkDegeri1 == null ||
                            renkDegeri2 == null ||
                            renkDegeri3 == null ||
                            renkDegeri4 == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor:
                                      Color.fromRGBO(255, 87, 87, 1),
                                  content: Text(
                                    "Eksik veya hatalı ifade girişi yaptınız !",
                                    textAlign: TextAlign.center,
                                  )));
                        } else {
                          toleransDegeri = ifadeler + renkDegeri4.toString();
                          birim = "kΩ";
                          sonuc = ((renkDegeri1! * 10) + renkDegeri2!) *
                              pow(10, renkDegeri3!).toDouble() /
                              pow(10, 3);
                          print(sonuc);
                          deger = sonuc.toString();
                        }
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Buton(
                    renkDegeri1: renkDegeri1,
                    renkDegeri2: renkDegeri2,
                    renkDegeri3: renkDegeri3,
                    width: size.width * 0.25,
                    childDegeri: "MΩ",
                    color: const Color.fromRGBO(255, 87, 87, 1),
                    onPressed: () {
                      setState(() {
                        if (renkDegeri1 == null ||
                            renkDegeri2 == null ||
                            renkDegeri3 == null ||
                            renkDegeri4 == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor:
                                      Color.fromRGBO(255, 87, 87, 1),
                                  content: Text(
                                    "Eksik veya hatalı ifade girişi yaptınız !",
                                    textAlign: TextAlign.center,
                                  )));
                        } else {
                          toleransDegeri = ifadeler + renkDegeri4.toString();
                          birim = "MΩ";
                          sonuc = ((renkDegeri1! * 10) + renkDegeri2!) *
                              pow(10, renkDegeri3!).toDouble() /
                              pow(10, 6);
                          print(sonuc);
                          deger = sonuc.toString();
                        }
                      });
                    },
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: size.height * 0.09,
              child: Text(
                "DİRENÇ DEĞERİ : \n $deger $birim $toleransDegeri",
                style: const TextStyle(
                    // color: Colors.grey[800],
                    fontWeight: FontWeight.w700,
                    // fontStyle: FontStyle.italic,
                    fontFamily: "Poppins",
                    fontSize: 20),
                textAlign: TextAlign.center,
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
      ]),
    );
  }
}
