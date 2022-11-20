import 'package:flutter/material.dart';

class YonButonlari extends StatelessWidget {
  String ifade;
  dynamic gelenDeger;
  YonButonlari({Key? key, required this.ifade, required this.gelenDeger})
      : super(key: key);

  void onPressed() {
    print(gelenDeger);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(ifade),
        style: ElevatedButton.styleFrom(
            primary: Colors.black,
            fixedSize: Size(size.width * 0.18, size.height * 0.18)));
  }
}
