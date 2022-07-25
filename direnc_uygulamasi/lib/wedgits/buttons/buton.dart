import 'package:flutter/material.dart';

class Buton extends StatelessWidget {
  final double? renkDegeri1;
  final double? renkDegeri2;
  final double? renkDegeri3;
  final String? childDegeri;
  final VoidCallback? onPressed;
  const Buton(
      {Key? key,
      this.renkDegeri1,
      this.renkDegeri2,
      this.renkDegeri3,
      this.onPressed,
      this.childDegeri})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(fixedSize: const Size(75, 50)),
      onPressed: onPressed,
      child: Text(
        childDegeri!,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
