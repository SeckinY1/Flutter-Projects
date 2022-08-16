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
  String birim = "";
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
      appBar: AppBar(title: const Text("Üç Bantlı Direnç Hesaplama")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                        renkDegeri1 = deger1!;
                      });
                    },
                    value: renkDegeri1,
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
                        renkDegeri2 = deger2!;
                      });
                    },
                    value: renkDegeri2,
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
                    onChanged: (double? deger3) {
                      setState(() {
                        renkDegeri3 = deger3;
                      });
                    },
                    value: renkDegeri3,
                    iconSize: 30,
                    iconEnabledColor: Colors.blue,
                  ),
                ),
                /*BantSecimi(
                    gelenRenkler: renkler,
                    gelenRenkDegeri: renkDegeri3,
                    onPressed: (double? deger3) {
                      setState(() {
                        renkDegeri3 = deger3;
                      });
                    })*/
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
                        if (renkDegeri1 == null ||
                            renkDegeri2 == null ||
                            renkDegeri3 == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Eksik veya hatalı ifade girişi yaptınız")));
                        } else {
                          birim = "Ω";
                          sonuc = ((renkDegeri1! * 10) + renkDegeri2!) *
                              pow(10, renkDegeri3!).toDouble();
                          print(sonuc);
                          deger = sonuc.toString();
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
                        if (renkDegeri1 == null ||
                            renkDegeri2 == null ||
                            renkDegeri3 == null) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Eksik veya hatalı ifade girişi yaptınız.")));
                        } else {
                          birim = "kΩ";
                          sonuc = (((renkDegeri1! * 10) + renkDegeri2!) *
                                  pow(10, renkDegeri3!).toInt()) /
                              pow(10, 3);
                          print(sonuc);
                          deger = sonuc.toString();
                        }
                      });
                    },
                    child: const Text(
                      "kΩ",
                      style: TextStyle(fontSize: 20),
                    )),

                /*Buton(
                  renkDegeri1: renkDegeri1,
                  renkDegeri2: renkDegeri2,
                  renkDegeri3: renkDegeri3,
                  childDegeri: "Ω",
                  onPressed: () {
                    setState(() {
                      if (renkDegeri1 == null ||
                          renkDegeri2 == null ||
                          renkDegeri3 == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Eksik veya hatalı ifade girişi yaptınız")));
                      } else {
                        birim = "Ω";
                        sonuc = ((renkDegeri1! * 10) + renkDegeri2!) *
                            pow(10, renkDegeri3!).toDouble();
                        print(sonuc);
                        deger = sonuc.toString();
                      }
                    });
                  },
                )*/

                /*DropdownButton( Bu DropdownButton ohm, kohm ve megaohm seçenekleri    
                                  ve bir hesapla butonu için oluşturulmuştur. Ek olarak 
                                  hesapla butonu altında yapılan ve sonuc değişkeni içerisine kayıt edilen işlemde bu fonksiyonun çalışması için bölüm kısmına **bolum!.toDouble()** komutu yapıştırılmalıdır.
                  items: bolumMap
                      .map((oAnkiBirim, oAnkiDeger) {
                        return MapEntry(
                            oAnkiBirim,
                            DropdownMenuItem(
                              value: oAnkiDeger,
                              child: Text(oAnkiBirim),
                            ));
                      })
                      .values
                      .toList(),
                  onChanged: (double? deger) {
                    setState(() {
                      bolum = deger;
                    });
                  },
                  value: bolum,
                )*/
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Direnç Değeri: $deger $birim",
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
