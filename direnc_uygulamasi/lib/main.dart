import 'package:direnc_uygulamasi/wedgits/buttons/bant_secimi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Resistor Calculate",
      home:
          BantSecimi(isFirstStep: true, text: "İlk Band", width: 10, key: key),
    );
  }
}
