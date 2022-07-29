import 'package:flutter/material.dart';

class Buton extends StatelessWidget {
  final double? renkDegeri1;
  final double? renkDegeri2;
  final double? renkDegeri3;
  final String? childDegeri;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final Color? color;
  const Buton(
      {Key? key,
      required this.renkDegeri1,
      required this.renkDegeri2,
      required this.renkDegeri3,
      required this.onPressed,
      required this.childDegeri,
      this.color,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: color, fixedSize: const Size(75, 50)),
        onPressed: onPressed,
        child: Text(
          childDegeri!,
          style: const TextStyle(
              // color: Colors.grey[800],
              // fontWeight: FontWeight.w500,
              // fontStyle: FontStyle.italic,
              fontFamily: 'Open Sans',
              fontSize: 20),
        ),
      ),
    );
  }
}
