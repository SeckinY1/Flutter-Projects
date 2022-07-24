import 'package:flutter/material.dart';

class BantSecimi extends StatefulWidget {
  final bool isFirstStep;
  final double width;
  final String text;
  int? renkdegeri;

  BantSecimi({
    required this.isFirstStep,
    required this.width,
    required this.text,
    this.renkdegeri,
    Key? key,
  }) : super(key: key);

  @override
  State<BantSecimi> createState() => _BantSecimiState();
}

class _BantSecimiState extends State<BantSecimi> {
  Map<String, int> renklerIlkBasamak = {
    "Kahverengi": 1,
    "Kırmızı": 2,
    "Turuncu": 3,
    "Sarı": 4,
    "Yeşil": 5,
    "Mavi": 6,
    "Mor": 7,
    "Gri": 8,
    "Beyaz": 9
  };

  Map<String, int> renkler = {
    "Siyah": 0,
    "Kahverengi": 1,
    "Kırmızı": 2,
    "Turuncu": 3,
    "Sarı": 4,
    "Yeşil": 5,
    "Mavi": 6,
    "Mor": 7,
    "Gri": 8,
    "Beyaz": 9
  };

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        width: widget.width,
        height: 5,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(193, 193, 193, 1),
            borderRadius: BorderRadius.circular(5)),
        child: DropdownButton(
          alignment: Alignment.center,
          hint: Text(
            widget.text,
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          items: widget.isFirstStep == true
              ? renklerIlkBasamak
                  .map((oAnkiRenk, oAnkiDeger) {
                    return MapEntry(
                        oAnkiRenk,
                        DropdownMenuItem(
                          value: oAnkiDeger,
                          child: Text(oAnkiRenk),
                        ));
                  })
                  .values
                  .toList()
              : renkler
                  .map((oAnkiRenk, oAnkiDeger) {
                    return MapEntry(
                        oAnkiRenk,
                        DropdownMenuItem(
                          value: oAnkiDeger,
                          child: Text(oAnkiRenk),
                        ));
                  })
                  .values
                  .toList(),
          onChanged: (int? deger) {
            setState(() {
              widget.renkdegeri = deger!;
            });
          },
          value: widget.renkdegeri,
          iconSize: 30,
          iconEnabledColor: Colors.black,
        ),
      ),
    );
  }
}
