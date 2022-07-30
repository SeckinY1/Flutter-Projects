import 'package:flutter/material.dart';

class DirencRenkleri extends StatelessWidget {
  double? renkDegeri;
  double? height;
  DirencRenkleri({Key? key, required this.height, this.renkDegeri})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: 10,
      color: renkDegeri == 0
          ? Colors.black
          : renkDegeri == 1
              ? Colors.brown
              : renkDegeri == 2
                  ? const Color.fromARGB(255, 239, 16, 16)
                  : renkDegeri == 3
                      ? Colors.orange
                      : renkDegeri == 4
                          ? Colors.yellow
                          : renkDegeri == 5
                              ? Colors.green
                              : renkDegeri == 6
                                  ? Colors.blue
                                  : renkDegeri == 7
                                      ? Colors.purple
                                      : renkDegeri == 8
                                          ? Colors.grey
                                          : renkDegeri == 9
                                              ? Colors.white
                                              : renkDegeri == -1
                                                  ? const Color.fromRGBO(
                                                      255, 215, 0, 1)
                                                  : renkDegeri == -2
                                                      ? const Color.fromRGBO(
                                                          192, 192, 192, 1)
                                                      : Colors.transparent,
    );
  }
}
