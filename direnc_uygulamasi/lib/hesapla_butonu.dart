import 'dart:math';

import 'package:flutter/material.dart';

class HesaplaButonu extends StatefulWidget {
  HesaplaButonu({Key? key}) : super(key: key);

  @override
  State<HesaplaButonu> createState() => _HesaplaButonuState();
}

class _HesaplaButonuState extends State<HesaplaButonu> {
  int? renkDegeri1;
  int? renkDegeri2;
  int? renkDegeri3;
  String? birim;
  String? birimGir;
  double? sonuc;
  num bolum;

  _HesaplaButonuState(
      [this.renkDegeri1,
      this.renkDegeri2,
      this.renkDegeri3,
      this.birimGir,
      this.bolum = 1]);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            if (renkDegeri1 == null ||
                renkDegeri2 == null ||
                renkDegeri3 == null) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Eksik veya hatalı ifade girişi yaptınız")));
            } else {
              birim = birimGir;
              sonuc = (renkDegeri1! * 10) +
                  renkDegeri2! * pow(10, renkDegeri3!) / bolum;
            }
          });
        },
        child: Text("Olmadı gardaş"));
  }
}
