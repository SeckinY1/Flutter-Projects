import 'package:flutter/material.dart';

class ToleransRenkleri extends StatelessWidget {
  double? renkDegeri;
  double? height;
  ToleransRenkleri({Key? key, required this.height, this.renkDegeri})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: 10,
      color: renkDegeri == 1
          ? Colors.brown
          : renkDegeri == 2
              ? const Color.fromARGB(255, 239, 16, 16)
              : renkDegeri == 3
                  ? Colors.orange
                  : renkDegeri == 4
                      ? Colors.yellow
                      : renkDegeri == 0.5
                          ? Colors.green
                          : renkDegeri == 0.25
                              ? Colors.blue
                              : renkDegeri == 0.10
                                  ? Colors.purple
                                  : renkDegeri == 0.05
                                      ? Colors.grey
                                      : renkDegeri == 5
                                          ? const Color.fromRGBO(255, 215, 0, 1)
                                          : renkDegeri == 10
                                              ? const Color.fromRGBO(
                                                  192, 192, 192, 1)
                                              : Colors.transparent,
    );
  }
}
