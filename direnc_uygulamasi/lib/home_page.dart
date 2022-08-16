import 'package:direnc_uygulamasi/screens/alti_bant_hesaplama.dart';
import 'package:direnc_uygulamasi/screens/bes_bant_hesaplama.dart';
import 'package:direnc_uygulamasi/screens/dort_bant_hesaplama.dart';
import 'package:direnc_uygulamasi/screens/uc_bant_hesaplama.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: IntrinsicHeight(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: size.height * 0.35,
              width: size.width,
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  )),
              child: const Text(
                  "DİRENÇ HESAPLAMA UYGULAMASINA \n HOŞ GELDİNİZ \n\n  HESAPLAMAK İSTEDİĞİNİZ BANDI \n SEÇİNİZ",
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 1.5,
                    color: Colors.white,
                    fontFamily: "Roboto",
                  ),
                  textAlign: TextAlign.center),
            ),
            const SizedBox(height: 50),
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
                            builder: (context) => const DortBantHesaplama()));
                  },
                  text: "Dört Bant Direnç Hesaplama"),
            ),
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
                            builder: (context) => const BesBantHesaplama()));
                  },
                  text: "Beş Bant Direnç Hesaplama"),
            ),
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
                            builder: (context) => const AltiBantHesaplama()));
                  },
                  text: "Altı Bant Direnç Hesaplama"),
            ),
          ],
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
      style: ElevatedButton.styleFrom(fixedSize: const Size(210, 30)),
    );
  }
}
