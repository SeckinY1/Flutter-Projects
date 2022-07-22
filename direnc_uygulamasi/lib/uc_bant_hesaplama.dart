import 'package:flutter/material.dart';

class UcBantHesaplama extends StatefulWidget {
  UcBantHesaplama({Key? key}) : super(key: key);

  @override
  State<UcBantHesaplama> createState() => _UcBantHesaplamaState();
}

class _UcBantHesaplamaState extends State<UcBantHesaplama> {
  int? _renkDegeri1 = null;
  int? _renkDegeri2 = null;
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
          child: IntrinsicHeight(
        child: Row(
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
                    print("Renk değeri 1: $_renkDegeri1");
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
                    print("Renk değeri 2: $_renkDegeri2");
                  });
                })
          ],
        ),
      )),
    );
  }

  DropdownButton<int> dropDownButtonYapisi(
      Map<String, int> gelecekMap, gelenRenkDegeri) {
    return DropdownButton(
        items: gelecekMap
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
            gelenRenkDegeri = deger;
            print(_renkDegeri1);
          });
        },
        value: gelenRenkDegeri);
  }
}
