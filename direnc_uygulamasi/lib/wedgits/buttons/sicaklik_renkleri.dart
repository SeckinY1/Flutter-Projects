import 'package:flutter/material.dart';

class SicaklikRenkleri extends StatelessWidget {
  double? renkDegeri;
  double? height;
  SicaklikRenkleri({Key? key, required this.height, required this.renkDegeri})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(2.3)),
        color: renkDegeri == 100
            ? Colors.brown
            : renkDegeri == 50
                ? const Color.fromARGB(255, 239, 16, 16)
                : renkDegeri == 15
                    ? Colors.orange
                    : renkDegeri == 25
                        ? Colors.yellow
                        : renkDegeri == 10
                            ? Colors.blue
                            : renkDegeri == 5
                                ? Colors.purple
                                : Colors.transparent,
      ),
      height: height,
      width: 10,
    );
  }
}
