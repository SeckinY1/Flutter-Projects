import 'package:dinamik_ortalama_hesaplama/data/data_helper.dart';
import 'package:dinamik_ortalama_hesaplama/sabitler.dart';
import 'package:flutter/material.dart';

class HarflerDropDown extends StatefulWidget {
  Function harfDegeri;
  HarflerDropDown({required this.harfDegeri, Key? key}) : super(key: key);

  @override
  State<HarflerDropDown> createState() => _HarflerDropDownState();
}

class _HarflerDropDownState extends State<HarflerDropDown> {
  double secilenHarfDeger = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100.withOpacity(0.5),
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
        items: DataHelper.tumDerslerinHarfleri(),
        value: secilenHarfDeger,
        iconEnabledColor: Sabitler.anaRenk,
        underline: Container(),
        onChanged: (deger) {
          setState(() {
            secilenHarfDeger = deger!;
            widget.harfDegeri(secilenHarfDeger);
          });
        },
      ),
    );
    ;
  }
}
