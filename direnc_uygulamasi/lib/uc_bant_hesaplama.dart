import 'package:flutter/material.dart';

class UcBantHesaplama extends StatefulWidget {
  UcBantHesaplama({Key? key}) : super(key: key);

  @override
  State<UcBantHesaplama> createState() => _UcBantHesaplamaState();
}

class _UcBantHesaplamaState extends State<UcBantHesaplama> {
  int? _renkDegeri = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Üç Bantlı Direnç Hesaplama")),
      body: Center(
          child: IntrinsicHeight(
        child: Row(
          children: [
            DropdownButton(
                items: [DropdownMenuItem(child: Text("Kırmızı"), value: 1)],
                value: _renkDegeri,
                onChanged: (int? deger) {
                  setState(() {
                    _renkDegeri = deger;
                    print(_renkDegeri);
                  });
                })
          ],
        ),
      )),
    );
  }
}
