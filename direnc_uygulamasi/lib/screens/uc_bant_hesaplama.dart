import 'dart:math';
import 'package:direnc_uygulamasi/wedgits/buttons/bant_secimi.dart';
import 'package:direnc_uygulamasi/wedgits/buttons/buton.dart';
import 'package:direnc_uygulamasi/wedgits/buttons/direnc_renkleri.dart';
import 'package:flutter/material.dart';
import 'package:widget_utils/widget_utils.dart';

class UcBantHesaplama extends StatefulWidget {
  const UcBantHesaplama({Key? key}) : super(key: key);

  @override
  State<UcBantHesaplama> createState() => _UcBantHesaplamaState();
}

class _UcBantHesaplamaState extends State<UcBantHesaplama> {
  double? renkDegeri1;
  double? renkDegeri2;
  double? renkDegeri3;
  String? birim = "";
  String deger = "... Ω ± % 20";
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 135, 76, 253),
        title: const Text(" Üç Bantlı Direnç Hesaplama"),
      ),
      body: Column(children: [
        Container(
          height: convertSize(120),
          width: convertSize(300),
          decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage("assets/images/direnc.png")),
            //TO DO
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.white.withOpacity(0.5),
            //     spreadRadius: 5,
            //     blurRadius: 7,
            //     offset: const Offset(0, 3),
            //   ),
            // ],
          ),
          child: Row(children: [
            Padding(
                padding: EdgeInsets.only(left: convertSize(120)),
                child: DirencRenkleri(
                  height: convertSize(42),
                  renkDegeri: renkDegeri1,
                )),
            SizedBox(
              width: convertSize(10),
            ),
            DirencRenkleri(height: convertSize(42), renkDegeri: renkDegeri2),
            SizedBox(width: convertSize(10)),
            DirencRenkleri(height: convertSize(42), renkDegeri: renkDegeri3)
          ]),
        ),
        SizedBox(
          height: convertSize(300),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BantSecimi(
                  bgColor: const Color.fromARGB(255, 236, 234, 234),
                  width: convertSize(300),
                  height: convertSize(50),
                  text: "Değer Seçiniz",
                  gelenRenkler: renklerIlkBasamak,
                  gelenRenkDegeri: renkDegeri1,
                  onPressed: (double? deger1) {
                    setState(() {
                      renkDegeri1 = deger1;
                    });
                  }),
              SizedBox(
                height: convertSize(20),
              ),
              BantSecimi(
                  bgColor: const Color.fromARGB(255, 236, 234, 234),
                  width: convertSize(300),
                  height: convertSize(50),
                  text: "Değer Seçiniz",
                  gelenRenkler: renkler,
                  gelenRenkDegeri: renkDegeri2,
                  onPressed: (double? deger2) {
                    setState(() {
                      renkDegeri2 = deger2;
                    });
                  }),
              SizedBox(
                height: convertSize(20),
              ),
              BantSecimi(
                  bgColor: const Color.fromARGB(255, 236, 234, 234),
                  width: convertSize(300),
                  height: convertSize(50),
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
          height: convertSize(120),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Buton(
                renkDegeri1: renkDegeri1,
                renkDegeri2: renkDegeri2,
                renkDegeri3: renkDegeri3,
                width: convertSize(100),
                childDegeri: "Ω",
                color: const Color.fromRGBO(140, 82, 255, 1),
                onPressed: () {
                  setState(() {
                    if (renkDegeri1 == null ||
                        renkDegeri2 == null ||
                        renkDegeri3 == null) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Color.fromRGBO(140, 82, 255, 1),
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
              SizedBox(
                width: convertSize(20),
              ),
              Buton(
                renkDegeri1: renkDegeri1,
                renkDegeri2: renkDegeri2,
                renkDegeri3: renkDegeri3,
                width: convertSize(100),
                childDegeri: "kΩ",
                color: const Color.fromRGBO(140, 82, 255, 1),
                onPressed: () {
                  setState(() {
                    if (renkDegeri1 == null ||
                        renkDegeri2 == null ||
                        renkDegeri3 == null) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Color.fromRGBO(140, 82, 255, 1),
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
              SizedBox(
                width: convertSize(20),
              ),
              Buton(
                renkDegeri1: renkDegeri1,
                renkDegeri2: renkDegeri2,
                renkDegeri3: renkDegeri3,
                width: convertSize(100),
                childDegeri: "MΩ",
                color: const Color.fromRGBO(140, 82, 255, 1),
                onPressed: () {
                  setState(() {
                    if (renkDegeri1 == null ||
                        renkDegeri2 == null ||
                        renkDegeri3 == null) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Color.fromRGBO(140, 82, 255, 1),
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
          height: convertSize(60),
          child: Text(
            "DİRENÇ DEĞERİ : \n $deger $birim",
            style: TextStyle(
                // color: Colors.grey[800],
                fontWeight: FontWeight.w700,
                // fontStyle: FontStyle.italic,
                fontFamily: 'Open Sans',
                fontSize: convertSize(25)),
            textAlign: TextAlign.center,
          ),
        ),
      ]),
    );
  }
}
