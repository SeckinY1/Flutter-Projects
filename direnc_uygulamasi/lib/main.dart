import 'package:direnc_uygulamasi/screens/uc_bant_hesapla.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: "Resistor Calculate", home: UcBantHesaplama());
  }
}
