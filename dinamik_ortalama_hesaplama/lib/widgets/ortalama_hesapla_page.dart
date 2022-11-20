import 'package:dinamik_ortalama_hesaplama/data/data_helper.dart';
import 'package:dinamik_ortalama_hesaplama/model/dersler.dart';
import 'package:dinamik_ortalama_hesaplama/sabitler.dart';
import 'package:dinamik_ortalama_hesaplama/widgets/ders_listesi.dart';
import 'package:dinamik_ortalama_hesaplama/widgets/harfler_dropDown.dart';
import 'package:dinamik_ortalama_hesaplama/widgets/kredilerDropDown.dart';
import 'package:dinamik_ortalama_hesaplama/widgets/ortalama_goster.dart';
import 'package:flutter/material.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({Key? key}) : super(key: key);

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  var formKey = GlobalKey<FormState>();
  double secilenHarfDeger = 4;
  double secilenKrediDegeri = 1;
  String girilenDersAdi = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // Ekran sığdırmada sorun çıkmazken klavye açıldığında pixel hatsı ile karşılaşırsa bu komut sayesinde o hata ortadan kaldırılır.
      appBar: AppBar(
          title: Center(
              child: Text(
            "Ortalama Hesaplama",
            style: Sabitler.baslikYapisi,
          )),
          backgroundColor: Colors.transparent,
          elevation: 0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(flex: 2, child: _buildForm()),
              Expanded(
                  child: Container(
                child: OrtalamaGoster(
                    dersSayisi: DataHelper.tumEklenenDersler.length,
                    ortalama: DataHelper.ortalamaHesapla()),
              ))
            ],
          ),
          Expanded(child: DersListesi(
            onDismiss: (index) {
              DataHelper.tumEklenenDersler.removeAt(index);
              setState(() {});
            },
          )),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: _buidTextFromField()),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: HarflerDropDown(harfDegeri: (harf) {
                      secilenHarfDeger = harf;
                    })),
              ),
              Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: KredilerDropDown(secilenKredi: (kredi){
                      secilenKrediDegeri = kredi;
                    })),
              ),
              IconButton(
                onPressed: dersEkle,
                icon: Icon(Icons.arrow_forward_ios_sharp),
                iconSize: 30,
                color: Sabitler.anaRenk,
              )
            ],
          )
        ],
      ),
    );
  }

  _buidTextFromField() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          girilenDersAdi = deger!;
        });
      },
      validator: (s) {
        if (s!.length <= 0) {
          return "Ders Adı Giriniz";
        }
      },
      decoration: InputDecoration(
          hintText: "Ders Giriniz",
          border: OutlineInputBorder(
              borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
          filled: true,
          fillColor: Sabitler.anaRenk.shade100.withOpacity(0.5)),
    );
  }


  void dersEkle() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          ad: girilenDersAdi,
          harfDegeri: secilenHarfDeger,
          krediDegeri: secilenKrediDegeri);
      DataHelper.dersEkle(eklenecekDers);
      setState(() {});
    }
  }
}
