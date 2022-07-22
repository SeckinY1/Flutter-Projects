import 'dart:math';

import 'package:flutter/material.dart';

class UcBantHesaplama extends StatefulWidget {
  UcBantHesaplama({Key? key}) : super(key: key);

  @override
  State<UcBantHesaplama> createState() => _UcBantHesaplamaState();
}

class _UcBantHesaplamaState extends State<UcBantHesaplama> {
  int? _renkDegeri1 = null;
  int? _renkDegeri2 = null;
  int? _renkDegeri3 = null;
  double? _sonuc = null;
  Map<String, int> renklerIlkBasamak = {
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
  Map<String, int> renkler = {
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
      appBar: AppBar(title: Text("Üç Bantlı Direnç Hesaplama")),
      body: Center(
          child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*dropDownButtonYapisi(renklerIlkBasamak, _renkDegeri1),
              dropDownButtonYapisi(renkler, _renkDegeri2)*/
                DropdownButton(
                    hint: Text("Değer Giriniz"),
                    items: renklerIlkBasamak
                        .map((oAnkiRenk, oAnkiDeger) {
                          return MapEntry(
                              oAnkiRenk,
                              DropdownMenuItem(
                                child: Text(oAnkiRenk),
                                value: oAnkiDeger,
                              ));
                        })
                        .values
                        .toList(),
                    onChanged: (int? deger) {
                      setState(() {
                        _renkDegeri1 = deger;
                      });
                    },
                    value: _renkDegeri1),
                DropdownButton(
                  hint: Text("Değer Giriniz"),
                  items: renkler
                      .map((oAnkiRenk, oAnkiDeger) {
                        return MapEntry(
                            oAnkiRenk,
                            DropdownMenuItem(
                              child: Text(oAnkiRenk),
                              value: oAnkiDeger,
                            ));
                      })
                      .values
                      .toList(),
                  onChanged: (int? deger2) {
                    setState(() {
                      _renkDegeri2 = deger2;
                    });
                  },
                  value: _renkDegeri2,
                ),
                DropdownButton(
                  hint: Text("Değer Giriniz"),
                  items: renkler
                      .map((oAnkiRenk, oAnkiDeger) {
                        return MapEntry(
                            oAnkiRenk,
                            DropdownMenuItem(
                                child: Text(oAnkiRenk), value: oAnkiDeger));
                      })
                      .values
                      .toList(),
                  onChanged: (int? deger3) {
                    setState(() {
                      _renkDegeri3 = deger3;
                    });
                  },
                  value: _renkDegeri3,
                )
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  _sonuc = (((_renkDegeri1! * 10) + _renkDegeri2!) *
                          pow(10, _renkDegeri3!).toInt()) /
                      pow(10, 6).toInt();
                  print(_sonuc);
                },
                child: Text("Hesapla"))
          ],
        ),
      )),
    );
  }
}
