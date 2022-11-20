import 'package:bluetooth_uygulamasi/butonlar/yon_butonu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KontrolPaneli extends StatefulWidget {
  KontrolPaneli({Key? key}) : super(key: key);

  @override
  State<KontrolPaneli> createState() => _KontrolPaneliState();
}

class _KontrolPaneliState extends State<KontrolPaneli> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return Scaffold(
        body: Row(
      children: [
        Container(
          height: size.height * 1,
          width: size.width * 0.5,
          color: Colors.amber,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                YonButonlari(
                  ifade: "İleri Git",
                  gelenDeger: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    YonButonlari(ifade: "Sola Dön", gelenDeger: 3),
                    YonButonlari(ifade: "Sağa Dön", gelenDeger: 4)
                  ],
                ),
                YonButonlari(ifade: "Geri Git", gelenDeger: 2),
              ]),
        ),
        Container(
          height: size.height * 1,
          width: size.width * 0.5,
          color: Colors.blue,
        )
      ],
    ));
  }
}
