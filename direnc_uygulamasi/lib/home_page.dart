import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Resistor Calculate")),
      body: Center(
        child: IntrinsicHeight(
          child: Column(
            children: [
              elevatedButton(() {}, "Üç Bant Direnç Hesaplama"),
              elevatedButton(() {}, "Dört Bant Direnç Hesaplama"),
              elevatedButton(() {}, "Beş Bant Direnç Hesaplama"),
              elevatedButton(() {}, "Altı Bant Direnç Hesaplama"),
            ],
          ),
        ),
      ),
    );
  }
}

Widget elevatedButton(Function fonksiyon, String text) {
  return ElevatedButton(
      onPressed: () => fonksiyon,
      child: Text(text),
      style: ElevatedButton.styleFrom(fixedSize: const Size(210, 20)));
}
