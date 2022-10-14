import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'model/burc.dart';

class YonlendirmeEkrani extends StatefulWidget {
  Burc secilenBurc;
  YonlendirmeEkrani({Key? key, required this.secilenBurc}) : super(key: key);

  @override
  State<YonlendirmeEkrani> createState() => _YonlendirmeEkraniState();
}

class _YonlendirmeEkraniState extends State<YonlendirmeEkrani> {
  Color appBarRengi = Colors.transparent;
  late PaletteGenerator _generator;

  @override
  void initState() {
    super.initState();
    appBarRenginiBul();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          flexibleSpace: FlexibleSpaceBar(
            title: Text(widget.secilenBurc.burcAdi + " Burcu ve Özellikleri"),
            centerTitle: true,
            background: Image.asset(
              "images/${widget.secilenBurc.burcBuyukResmi}",
              fit: BoxFit.cover,
            ),
          ),
          backgroundColor: appBarRengi,
          expandedHeight: 250,
          pinned: true,
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Text(
                widget.secilenBurc.burcDetayi,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ]),
    );
  }

  void appBarRenginiBul() async {
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage("images/${widget.secilenBurc.burcBuyukResmi}"));
    setState(() {});
    appBarRengi = _generator.dominantColor!.color;
  }
}
