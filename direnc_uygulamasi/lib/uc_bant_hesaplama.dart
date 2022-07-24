import 'dart:math';

import 'package:flutter/material.dart';

class UcBantHesaplama extends StatefulWidget {
  const UcBantHesaplama({Key? key}) : super(key: key);

  @override
  State<UcBantHesaplama> createState() => _UcBantHesaplamaState();
}

class _UcBantHesaplamaState extends State<UcBantHesaplama> {
  double? _renkDegeri1;
  double? _renkDegeri2;
  double? _renkDegeri3;
  String _birim = "";
  String _deger = "";
  double? _sonuc;

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
      appBar: AppBar(title: const Text("Üç Bantlı Direnç Hesaplama")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*dropDownButtonYapisi(renklerIlkBasamak, _renkDegeri1),
              dropDownButtonYapisi(renkler, _renkDegeri2)*/
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(5)),
                  child: DropdownButton(
                    alignment: Alignment.center,
                    hint: const Text(
                      "Değer Giriniz",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    items: renklerIlkBasamak
                        .map((oAnkiRenk, oAnkiDeger) {
                          return MapEntry(
                              oAnkiRenk,
                              DropdownMenuItem(
                                value: oAnkiDeger,
                                child: Text(oAnkiRenk),
                              ));
                        })
                        .values
                        .toList(),
                    onChanged: (double? deger1) {
                      setState(() {
                        _renkDegeri1 = deger1;
                      });
                    },
                    value: _renkDegeri1,
                    iconSize: 30,
                    iconEnabledColor: Colors.blue,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(5)),
                  child: DropdownButton(
                    alignment: Alignment.center,
                    hint: const Text(
                      "Değer Giriniz",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    items: renkler
                        .map((oAnkiRenk, oAnkiDeger) {
                          return MapEntry(
                              oAnkiRenk,
                              DropdownMenuItem(
                                value: oAnkiDeger,
                                child: Text(oAnkiRenk),
                              ));
                        })
                        .values
                        .toList(),
                    onChanged: (double? deger2) {
                      setState(() {
                        _renkDegeri2 = deger2;
                      });
                    },
                    value: _renkDegeri2,
                    iconSize: 30,
                    iconEnabledColor: Colors.blue,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(5)),
                  child: DropdownButton(
                    alignment: Alignment.center,
                    hint: const Text(
                      "Değer Giriniz",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    items: renkler
                        .map((oAnkiRenk, oAnkiDeger) {
                          return MapEntry(
                              oAnkiRenk,
                              DropdownMenuItem(
                                  value: oAnkiDeger, child: Text(oAnkiRenk)));
                        })
                        .values
                        .toList(),
                    onChanged: (double? deger3) {
                      setState(() {
                        _renkDegeri3 = deger3;
                      });
                    },
                    value: _renkDegeri3,
                    iconSize: 30,
                    iconEnabledColor: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(fixedSize: const Size(75, 50)),
                    onPressed: () {
                      setState(() {
                        if (_renkDegeri1 == null ||
                            _renkDegeri2 == null ||
                            _renkDegeri3 == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Eksik veya hatalı ifade girişi yaptınız")));
                        } else {
                          _birim = "Ω";
                          _sonuc = ((_renkDegeri1! * 10) + _renkDegeri2!) *
                              pow(10, _renkDegeri3!).toDouble();
                          print(_sonuc);
                          _deger = _sonuc.toString();
                        }
                      });
                    },
                    child: const Text(
                      "Ω",
                      style: TextStyle(fontSize: 20),
                    )),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(fixedSize: const Size(75, 50)),
                    onPressed: () {
                      setState(() {
                        if (_renkDegeri1 == null ||
                            _renkDegeri2 == null ||
                            _renkDegeri3 == null) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Eksik veya hatalı ifade girişi yaptınız.")));
                        } else {
                          _birim = "kΩ";
                          _sonuc = (((_renkDegeri1! * 10) + _renkDegeri2!) *
                                  pow(10, _renkDegeri3!).toInt()) /
                              pow(10, 3).toInt();
                          print(_sonuc);
                          _deger = _sonuc.toString();
                        }
                      });
                    },
                    child: const Text(
                      "kΩ",
                      style: TextStyle(fontSize: 20),
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Direnç Değeri: $_deger $_birim",
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
