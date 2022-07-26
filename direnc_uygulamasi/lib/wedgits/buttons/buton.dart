import 'package:flutter/material.dart';

class Buton extends StatelessWidget {
  final double? renkDegeri1;
  final double? renkDegeri2;
  final double? renkDegeri3;
  final String? childDegeri;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  const Buton(
      {Key? key,
      required this.renkDegeri1,
      required this.renkDegeri2,
      required this.renkDegeri3,
      required this.onPressed,
      required this.childDegeri,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(fixedSize: const Size(75, 50)),
        onPressed: onPressed,
        child: Text(
          childDegeri!,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
