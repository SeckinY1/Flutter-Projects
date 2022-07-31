import 'package:direnc_uygulamasi/screens/alti_bant_hesaplama.dart';
import 'package:direnc_uygulamasi/screens/bes_bant_hesaplama.dart';
import 'package:direnc_uygulamasi/screens/dort_bant_hesaplama.dart';
import 'package:direnc_uygulamasi/screens/uc_bant_hesaplama.dart';
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
              ElevatedButon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UcBantHesaplama()));
                  },
                  text: "Üç Bant Direnç Hesaplama"),
              ElevatedButon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DortBantHesaplama()));
                  },
                  text: "Dört Bant Direnç Hesaplama"),
              ElevatedButon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BesBantHesaplama()));
                  },
                  text: "Beş Bant Direnç Hesaplama"),
              ElevatedButon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AltiBantHesaplama()));
                  },
                  text: "Altı Bant Direnç Hesaplama"),
            ],
          ),
        ),
      ),
    );
  }
}

class ElevatedButon extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  ElevatedButon({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
      style: ElevatedButton.styleFrom(fixedSize: const Size(210, 20)),
    );
  }
}
