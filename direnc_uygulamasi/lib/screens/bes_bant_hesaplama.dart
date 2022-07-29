import 'dart:math';

import 'package:direnc_uygulamasi/wedgits/buttons/bant_secimi.dart';
import 'package:direnc_uygulamasi/wedgits/buttons/buton.dart';
import 'package:flutter/material.dart';

class BesBantHesaplama extends StatefulWidget {
  const BesBantHesaplama({Key? key}) : super(key: key);

  @override
  State<BesBantHesaplama> createState() => _BesBantHesaplamaState();
}

class _BesBantHesaplamaState extends State<BesBantHesaplama> {
  double? renkDegeri1;
  double? renkDegeri2;
  double? renkDegeri3;
  double? renkDegeri4;
  double? renkDegeri5; // TO DO

  String? birim = "";
  String deger = "... Ω ± ... %";
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Beş Bantlı Direnç Hesaplama"),
      ),
      body: Column(children: [
        Container(height: 120),
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
                  gelenRenkler: renkler,
                  gelenRenkDegeri: renkDegeri4,
                  onPressed: (double? deger4) {
                    setState(() {
                      renkDegeri4 = deger4;
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
                  gelenRenkDegeri: renkDegeri5,
                  onPressed: (double? deger5) {
                    setState(() {
                      renkDegeri5 = deger5;
                    });
                  })
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
                width: 100,
                childDegeri: "Ω",
                color: const Color.fromARGB(255, 240, 155, 81),
                onPressed: () {
                  setState(() {
                    if (renkDegeri1 == null ||
                        renkDegeri2 == null ||
                        renkDegeri3 == null) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content:
                              Text("Eksik veya hatalı ifade girişi yaptınız")));
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
                width: 100,
                childDegeri: "kΩ",
                color: const Color.fromARGB(255, 240, 155, 81),
                onPressed: () {
                  setState(() {
                    if (renkDegeri1 == null ||
                        renkDegeri2 == null ||
                        renkDegeri3 == null) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content:
                              Text("Eksik veya hatalı ifade girişi yaptınız")));
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
                width: 100,
                childDegeri: "MΩ",
                color: const Color.fromARGB(255, 240, 155, 81),
                onPressed: () {
                  setState(() {
                    if (renkDegeri1 == null ||
                        renkDegeri2 == null ||
                        renkDegeri3 == null) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content:
                              Text("Eksik veya hatalı ifade girişi yaptınız")));
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
          height: 60,
          child: Text(
            "DİRENÇ DEĞERİ : \n $deger $birim",
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