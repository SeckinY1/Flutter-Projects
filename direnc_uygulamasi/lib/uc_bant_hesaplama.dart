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
            dropDownButtonYapisi(renklerIlkBasamak),
            dropDownButtonYapisi(renkler)
          ],
        ),
      )),
    );
  }

  DropdownButton<int> dropDownButtonYapisi(Map<String, int> gelecekMap) {
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
        value: _renkDegeri1,
        onChanged: (int? deger) {
          setState(() {
            _renkDegeri1 = deger;
            print(_renkDegeri1);
          });
        });
  }
}
