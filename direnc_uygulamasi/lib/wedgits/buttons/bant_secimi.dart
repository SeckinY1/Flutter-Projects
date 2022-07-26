import 'package:flutter/material.dart';

class BantSecimi extends StatelessWidget {
  final Map<String, double>? gelenRenkler;
  final Function(double?)? onPressed;
  final double? gelenRenkDegeri;
  final double? width;
  final double? height;

  const BantSecimi(
      {Key? key,
      required this.gelenRenkler,
      required this.gelenRenkDegeri,
      required this.onPressed,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.blue),
            borderRadius: BorderRadius.circular(5)),
        child: DropdownButton(
          alignment: Alignment.center,
          hint: const Text(
            "Değer Giriniz",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          items: gelenRenkler!
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
          onChanged: onPressed,
          value: gelenRenkDegeri,
          iconSize: 30,
          iconEnabledColor: Colors.blue,
        ),
      ),
    );
  }
}
