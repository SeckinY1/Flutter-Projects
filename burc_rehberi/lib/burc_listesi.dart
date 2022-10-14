import 'package:burc_rehberi/burc_item.dart';
import 'package:burc_rehberi/data/strings.dart';
import 'package:flutter/material.dart';

import 'model/burc.dart';

class BurcListesi extends StatelessWidget {
  late List<Burc> tumBurclar;

  BurcListesi() {
    tumBurclar = veriKaynagiOlustur();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Burç Rehberi")),
      body: Center(
          child: ListView.builder(
        itemBuilder: (context, index) {
          return BurcItem(listelenenBurc: tumBurclar[index]);
        },
        itemCount: tumBurclar.length,
      )),
    );
  }

  List<Burc> veriKaynagiOlustur() {
    List<Burc> geciciList = [];

    for (int i = 0; i < 12; i++) {
      String burcadi = Strings.BURC_ADLARI[i];
      String burcTarihleri = Strings.BURC_TARIHLERI[i];
      String burcGenelOzellikleri = Strings.BURC_GENEL_OZELLIKLERI[i];
      String burcKucukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}.png";
      String burcBuyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk" + "${i + 1}.png";
      Burc eklenecekBurc = Burc(burcadi, burcTarihleri, burcGenelOzellikleri,
          burcKucukResim, burcBuyukResim);
      geciciList.add(eklenecekBurc);
    }
    return geciciList;
  }
}
