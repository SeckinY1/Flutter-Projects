import 'package:dinamik_ortalama_hesaplama/data/data_helper.dart';
import 'package:dinamik_ortalama_hesaplama/sabitler.dart';
import 'package:flutter/material.dart';

class KredilerDropDown extends StatefulWidget {
  Function secilenKredi;
  KredilerDropDown({required this.secilenKredi, Key? key}) : super(key: key);

  @override
  State<KredilerDropDown> createState() => _KredilerDropDownState();
}

class _KredilerDropDownState extends State<KredilerDropDown> {
  double secilenKrediDegeri = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100.withOpacity(0.5),
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
        items: DataHelper.tumDerslerinKredileri(),
        value: secilenKrediDegeri,
        iconEnabledColor: Sabitler.anaRenk,
        underline: Container(),
        onChanged: (deger) {
          setState(() {
            secilenKrediDegeri = deger!;
            widget.secilenKredi(secilenKrediDegeri);
          });
        },
      ),
    );
  }
}
