import 'dart:math';

import 'package:direnc_uygulamasi/wedgits/buttons/bant_secimi.dart';
import 'package:direnc_uygulamasi/wedgits/buttons/buton.dart';
import 'package:flutter/material.dart';

class UcBantHesaplama extends StatefulWidget {
  const UcBantHesaplama({Key? key}) : super(key: key);

  @override
  State<UcBantHesaplama> createState() => _UcBantHesaplamaState();
}

class _UcBantHesaplamaState extends State<UcBantHesaplama> {
  double? renkDegeri1;
  double? renkDegeri2;
  double? renkDegeri3;
  String deger = "";
  double? sonuc;
  double? bolum;

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
  Map<String, double> bolumMap = {"Ω": 1, "kΩ": 1000, "MΩ": 1000000};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Üç Bantlı Direnç Hesaplama"),
      ),
      body: Column(children: [
        Container(height: 120, color: Colors.red),
        SizedBox(
          height: 240,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BantSecimi(
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
                height: 20,
              ),
              BantSecimi(
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
                height: 20,
              ),
              BantSecimi(
                  width: 300,
                  height: 50,
                  text: "Değer Seçiniz",
                  gelenRenkler: renkler,
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
          height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Buton(
                renkDegeri1: renkDegeri1,
                renkDegeri2: renkDegeri2,
                renkDegeri3: renkDegeri3,
                width: 200,
                childDegeri: "Hesapla",
                onPressed: () {
                  setState(() {
                    if (renkDegeri1 == null ||
                        renkDegeri2 == null ||
                        renkDegeri3 == null ||
                        bolum == null) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content:
                              Text("Eksik veya hatalı ifade girişi yaptınız")));
                    } else {
                      sonuc = ((renkDegeri1! * 10) + renkDegeri2!) *
                          pow(10, renkDegeri3!).toDouble() /
                          bolum!.toDouble();
                      print(sonuc);
                      deger = sonuc.toString();
                    }
                  });
                },
              ),
              BantSecimi(
                  gelenRenkler: bolumMap,
                  gelenRenkDegeri: bolum,
                  onPressed: (double? deger4) {
                    setState(() {
                      bolum = deger4;
                    });
                  },
                  width: 125,
                  height: 50,
                  text: "Birim Seçiniz")
            ],
          ),
        ),
        Container(
          height: 120,
          child: Text(
            "Direnç Değeri: $deger",
            style: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
          ),
        )
      ]),
    );
  }
}
