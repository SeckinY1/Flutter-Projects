import 'package:flutter/material.dart';

class BantSecimi extends StatelessWidget {
  final Map<String, double>? gelenRenkler;
  final Function(double?)? onPressed;
  final double? gelenRenkDegeri;
  final double? width;
  final double? height;
  final String? text;
  final Color? bgColor;

  const BantSecimi(
      {Key? key,
      required this.gelenRenkler,
      required this.gelenRenkDegeri,
      required this.onPressed,
      required this.width,
      required this.height,
      required this.text,
      required this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: bgColor,
            border: Border.all(width: 2, color: Colors.grey),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: DropdownButton(
            hint: Text(
              text!,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppins"),
            ),
            items: gelenRenkler!
                .map((oAnkiRenk, oAnkiDeger) {
                  return MapEntry(
                      oAnkiRenk,
                      DropdownMenuItem(
                        value: oAnkiDeger,
                        child: Text(oAnkiRenk,
                            style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14,
                            )),
                      ));
                })
                .values
                .toList(),
            onChanged: onPressed,
            value: gelenRenkDegeri,
            iconSize: 30,
            isExpanded: true,
          ),
        ),
      ),
    );
  }
}
