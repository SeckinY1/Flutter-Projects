import 'package:direnc_uygulamasi/wedgits/buttons/bant_secimi.dart';
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
        title: const Text(" Üç Bantlı Direnç Hesaplama"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(height: 120, color: Colors.red),
          SizedBox(
            height: 297.445,
            child: Column(
              children: [
                BantSecimi(
                    width: 300,
                    height: 50,
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
          Container(height: 120, color: Colors.green),
          Container(height: 120, color: Colors.yellow),
        ],
      ),
    );
  }
}
