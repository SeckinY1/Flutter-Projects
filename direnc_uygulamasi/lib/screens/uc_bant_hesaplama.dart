import 'dart:io';
import 'dart:math';

import 'package:direnc_uygulamasi/wedgits/buttons/bant_secimi.dart';
import 'package:direnc_uygulamasi/wedgits/buttons/buton.dart';
import 'package:direnc_uygulamasi/wedgits/buttons/direnc_renkleri.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class UcBantHesaplama extends StatefulWidget {
  const UcBantHesaplama({Key? key}) : super(key: key);

  @override
  State<UcBantHesaplama> createState() => _UcBantHesaplamaState();
}

class _UcBantHesaplamaState extends State<UcBantHesaplama> {
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
  String? birim = "";
  String deger = "... Ω";
  String ifadeler = "± % 20";
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 135, 76, 253),
        title: const Text(
          " Üç Bantlı Direnç Hesaplama",
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
                    image: AssetImage("assets/images/direnc.png"),
                    fit: BoxFit.fill),
              ),
              child: Row(children: [
                Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.28, bottom: size.height * 0.003),
                    child: DirencRenkleri(
                      height: size.height * 0.057,
                      renkDegeri: renkDegeri1,
                    )),
                Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.06, bottom: size.height * 0.003),
                  child: DirencRenkleri(
                      height: size.height * 0.057, renkDegeri: renkDegeri2),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.06, bottom: size.height * 0.003),
                  child: DirencRenkleri(
                      height: size.height * 0.057, renkDegeri: renkDegeri3),
                )
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
                    height: 20,
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
                    height: 20,
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
                      })
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
                    color: const Color.fromRGBO(140, 82, 255, 1),
                    onPressed: () {
                      setState(() {
                        if (renkDegeri1 == null ||
                            renkDegeri2 == null ||
                            renkDegeri3 == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor:
                                      Color.fromRGBO(140, 82, 255, 1),
                                  content: Text(
                                    "Eksik veya hatalı ifade girişi yaptınız !",
                                    textAlign: TextAlign.center,
                                  )));
                        } else {
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
                    width: size.width * 0.25,
                    childDegeri: "kΩ",
                    color: const Color.fromRGBO(140, 82, 255, 1),
                    onPressed: () {
                      setState(() {
                        if (renkDegeri1 == null ||
                            renkDegeri2 == null ||
                            renkDegeri3 == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor:
                                      Color.fromRGBO(140, 82, 255, 1),
                                  content: Text(
                                    "Eksik veya hatalı ifade girişi yaptınız !",
                                    textAlign: TextAlign.center,
                                  )));
                        } else {
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
                    color: const Color.fromRGBO(140, 82, 255, 1),
                    onPressed: () {
                      setState(() {
                        if (renkDegeri1 == null ||
                            renkDegeri2 == null ||
                            renkDegeri3 == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor:
                                      Color.fromRGBO(140, 82, 255, 1),
                                  content: Text(
                                    "Eksik veya hatalı ifade girişi yaptınız !",
                                    textAlign: TextAlign.center,
                                  )));
                        } else {
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
                "DİRENÇ DEĞERİ : \n $deger $birim  $ifadeler",
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
