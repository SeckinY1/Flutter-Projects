import 'package:flutter/material.dart';

class BantSecimi extends StatelessWidget {
  final Map<String, double>? gelenRenkler;
  final Function(double?)? onPressed;
  final double? gelenRenkDegeri;
  final double? width;
  final double? height;
  final String? text;

  const BantSecimi(
      {Key? key,
      required this.gelenRenkler,
      required this.gelenRenkDegeri,
      required this.onPressed,
      required this.width,
      required this.height,
      required this.text})
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
        child: Padding(
          padding: EdgeInsets.only(left: 15),
          child: DropdownButton(
            hint: Text(
              text!,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
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
            isExpanded: true,
          ),
        ),
      ),
    );
  }
}
