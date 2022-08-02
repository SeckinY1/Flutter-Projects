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
              const Text(
                  "DİRENÇ HESAPLAMA UYGULAMASINA \n HOŞ GELDİNİZ \n\n  HESAPLAMAK İSTEDİĞİNİZ BANDI SEÇİNİZ",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                width: 250,
                height: 60,
                child: ElevatedButon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UcBantHesaplama()));
                    },
                    text: "Üç Bant Direnç Hesaplama"),
              ),
              const SizedBox(height: 20),
              Container(
                width: 250,
                height: 60,
                child: ElevatedButon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DortBantHesaplama()));
                    },
                    text: "Dört Bant Direnç Hesaplama"),
              ),
              const SizedBox(height: 20),
              Container(
                width: 250,
                height: 60,
                child: ElevatedButon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BesBantHesaplama()));
                    },
                    text: "Beş Bant Direnç Hesaplama"),
              ),
              const SizedBox(height: 20),
              Container(
                width: 250,
                height: 60,
                child: ElevatedButon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AltiBantHesaplama()));
                    },
                    text: "Altı Bant Direnç Hesaplama"),
              ),
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
