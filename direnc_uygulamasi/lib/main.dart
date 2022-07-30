import 'package:direnc_uygulamasi/screens/alti_bant_hesaplama.dart';
import 'package:direnc_uygulamasi/screens/bes_bant_hesaplama.dart';
import 'package:direnc_uygulamasi/screens/dort_bant_hesaplama.dart';
import 'package:direnc_uygulamasi/screens/uc_bant_hesaplama.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: "Resistor Calculate", home: AltiBantHesaplama());
  }
}
