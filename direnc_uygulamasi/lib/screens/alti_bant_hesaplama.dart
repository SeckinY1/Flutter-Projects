import 'dart:math';

import 'package:direnc_uygulamasi/wedgits/buttons/bant_secimi.dart';
import 'package:direnc_uygulamasi/wedgits/buttons/buton.dart';
import 'package:direnc_uygulamasi/wedgits/buttons/direnc_renkleri.dart';
import 'package:direnc_uygulamasi/wedgits/buttons/sicaklik_renkleri.dart';
import 'package:direnc_uygulamasi/wedgits/buttons/tolerans_renkleri.dart';
import 'package:flutter/material.dart';

class AltiBantHesaplama extends StatefulWidget {
  const AltiBantHesaplama({Key? key}) : super(key: key);

  @override
  State<AltiBantHesaplama> createState() => _AltiBantHesaplamaState();
}

class _AltiBantHesaplamaState extends State<AltiBantHesaplama> {
  double? renkDegeri1;
  double? renkDegeri2;
  double? renkDegeri3;
  double? renkDegeri4;
  double? renkDegeri5; // TO DO
  double? renkDegeri6; // TO DO

  String? birim = "";
  String ifadeler = "± %";
  String virgul = ",";
  String ppm = "PPM";
  String deger = "... Ω ± % ..., ... PPM";
  String? toleransDegeri = "";
  String? sicaklikDegeri = "";
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
    "Gri": 8,
    "Beyaz": 9,
    "Altın": -1,
    "Gümüş": -2
  };

  Map<String, double> tolerans = {
    "Kahverengi": 1,
    "Kırmızı": 2,
    "Turuncu": 3,
    "Sarı": 4,
    "Yeşil": 0.5,
    "Mavi": 0.25,
    "Mor": 0.10,
    "Gri": 0.05,
    "Altın": 5,
    "Gümüş": 10
  };

  Map<String, double> sicaklikKatsayisi = {
    "Kahverengi": 100,
    "Kırmızı": 50,
    "Turuncu": 15,
    "Sarı": 25,
    "Mavi": 10,
    "Mor": 5,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 18, 184, 10),
        title: const Text(" Altı Bantlı Direnç Hesaplama"),
      ),
      body: Column(children: [
        Container(
          height: 120,
          width: 300,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/direnc.png"))),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 80),
              child: DirencRenkleri(height: 52, renkDegeri: renkDegeri1),
            ),
            const SizedBox(
              width: 25,
            ),
            DirencRenkleri(height: 42, renkDegeri: renkDegeri2),
            const SizedBox(
              width: 10,
            ),
            DirencRenkleri(height: 42, renkDegeri: renkDegeri3),
            const SizedBox(
              width: 10,
            ),
            DirencRenkleri(height: 42, renkDegeri: renkDegeri4),
            const SizedBox(
              width: 10,
            ),
            ToleransRenkleri(height: 42, renkDegeri: renkDegeri5),
            const SizedBox(
              width: 20,
            ),
            SicaklikRenkleri(height: 52, renkDegeri: renkDegeri6)
          ]),
        ),
        SizedBox(
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BantSecimi(
                  bgColor: const Color.fromARGB(255, 236, 234, 234),
                  width: 300,
                  height: 50,
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
                  width: 300,
                  height: 50,
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
                  width: 300,
                  height: 50,
                  text: "Değer Seçiniz",
                  gelenRenkler: renkler,
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
                  width: 300,
                  height: 50,
                  text: "Değer Seçiniz",
                  gelenRenkler: carpan,
                  gelenRenkDegeri: renkDegeri4,
                  onPressed: (double? deger4) {
                    setState(() {
                      renkDegeri4 = deger4;
                    });
                  }),
              const SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                BantSecimi(
                    bgColor: const Color.fromARGB(255, 236, 234, 234),
                    width: 145,
                    height: 50,
                    text: "Değer Seçiniz",
                    gelenRenkler: tolerans,
                    gelenRenkDegeri: renkDegeri5,
                    onPressed: (double? deger5) {
                      setState(() {
                        renkDegeri5 = deger5;
                      });
                    }),
                const SizedBox(
                  width: 10,
                ),
                BantSecimi(
                    bgColor: const Color.fromARGB(255, 236, 234, 234),
                    width: 145,
                    height: 50,
                    text: "Değer Seçiniz",
                    gelenRenkler: sicaklikKatsayisi,
                    gelenRenkDegeri: renkDegeri6,
                    onPressed: (double? deger6) {
                      setState(() {
                        renkDegeri6 = deger6;
                      });
                    }),
              ]),
            ],
          ),
        ),
        SizedBox(
          height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Buton(
                renkDegeri1: renkDegeri1,
                renkDegeri2: renkDegeri2,
                renkDegeri3: renkDegeri3,
                renkDegeri4: renkDegeri4,
                renkDegeri5: renkDegeri5,
                renkDegeri6: renkDegeri6,
                width: 100,
                childDegeri: "Ω",
                color: const Color.fromRGBO(22, 198, 12, 1),
                onPressed: () {
                  setState(() {
                    if (renkDegeri1 == null ||
                        renkDegeri2 == null ||
                        renkDegeri3 == null ||
                        renkDegeri4 == null ||
                        renkDegeri5 == null ||
                        renkDegeri6 == null) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Color.fromRGBO(22, 198, 12, 1),
                          content: Text(
                            "Eksik veya hatalı ifade girişi yaptınız !",
                            textAlign: TextAlign.center,
                          )));
                    } else {
                      toleransDegeri =
                          ifadeler + renkDegeri5.toString() + virgul;
                      sicaklikDegeri = renkDegeri6.toString() + ppm;
                      birim = "Ω";
                      sonuc = ((renkDegeri1! * 100) +
                              (renkDegeri2! * 10) +
                              (renkDegeri3!)) *
                          pow(10, renkDegeri4!).toDouble();
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
                renkDegeri5: renkDegeri5,
                renkDegeri6: renkDegeri6,
                width: 100,
                childDegeri: "kΩ",
                color: const Color.fromRGBO(22, 198, 12, 1),
                onPressed: () {
                  setState(() {
                    if (renkDegeri1 == null ||
                        renkDegeri2 == null ||
                        renkDegeri3 == null ||
                        renkDegeri4 == null ||
                        renkDegeri5 == null ||
                        renkDegeri6 == null) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Color.fromRGBO(22, 198, 12, 1),
                          content: Text(
                            "Eksik veya hatalı ifade girişi yaptınız !",
                            textAlign: TextAlign.center,
                          )));
                    } else {
                      toleransDegeri =
                          ifadeler + renkDegeri5.toString() + virgul;
                      sicaklikDegeri = renkDegeri6.toString() + ppm;
                      birim = "kΩ";
                      sonuc = ((renkDegeri1! * 100) +
                              (renkDegeri2! * 10) +
                              (renkDegeri3!)) *
                          pow(10, renkDegeri4!).toDouble() /
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
                renkDegeri4: renkDegeri4,
                renkDegeri5: renkDegeri5,
                renkDegeri6: renkDegeri6,
                width: 100,
                childDegeri: "MΩ",
                color: const Color.fromRGBO(22, 198, 12, 1),
                onPressed: () {
                  setState(() {
                    if (renkDegeri1 == null ||
                        renkDegeri2 == null ||
                        renkDegeri3 == null ||
                        renkDegeri4 == null ||
                        renkDegeri5 == null ||
                        renkDegeri6 == null) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Color.fromRGBO(22, 198, 12, 1),
                          content: Text(
                            "Eksik veya hatalı ifade girişi yaptınız !",
                            textAlign: TextAlign.center,
                          )));
                    } else {
                      toleransDegeri =
                          ifadeler + renkDegeri5.toString() + virgul;
                      sicaklikDegeri = renkDegeri6.toString() + ppm;
                      birim = "MΩ";
                      sonuc = ((renkDegeri1! * 100) +
                              (renkDegeri2! * 10) +
                              (renkDegeri3!)) *
                          pow(10, renkDegeri4!).toDouble() /
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
          height: 60,
          child: Text(
            "DİRENÇ DEĞERİ : \n $deger $birim $toleransDegeri $sicaklikDegeri",
            style: const TextStyle(
                // color: Colors.grey[800],
                fontWeight: FontWeight.w700,
                // fontStyle: FontStyle.italic,
                fontFamily: 'Open Sans',
                fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ),
      ]),
    );
  }
}
