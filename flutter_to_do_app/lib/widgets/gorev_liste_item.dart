import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/data/local_hafiza.dart';
import 'package:flutter_to_do_app/main.dart';
import '../models/gorev_model.dart';
import 'package:intl/intl.dart';

class GorevItem extends StatefulWidget {
  Gorev gorev;
  GorevItem({super.key, required this.gorev});

  @override
  State<GorevItem> createState() => _GorevItemState();
}

class _GorevItemState extends State<GorevItem> {
  final TextEditingController _gorevAdi = TextEditingController();
  late LocalHafiza _localHafiza;

  @override
  void initState() {
    super.initState();
    _localHafiza = locator<LocalHafiza>();
  }

  @override
  Widget build(BuildContext context) {
    _gorevAdi.text = widget.gorev.name;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.1),
                blurRadius: 10,
                offset: const Offset(0, 4))
          ]),
      child: ListTile(
        leading: GestureDetector(
          onTap: () {
            widget.gorev.tamamlandiMi = !widget.gorev.tamamlandiMi;
            _localHafiza.gorevGuncelle(gorev: widget.gorev);
            setState(() {});
          },
          child: Container(
            decoration: BoxDecoration(
                color: widget.gorev.tamamlandiMi ? Colors.green : Colors.white,
                border: Border.all(color: Colors.grey, width: 0.8),
                shape: BoxShape.circle),
            child: const Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),
        ),
        title: widget.gorev.tamamlandiMi
            ? Text(
                widget.gorev.name,
                style: const TextStyle(
                    decoration: TextDecoration.lineThrough, color: Colors.grey),
              )
            : TextField(
                controller: _gorevAdi,
                minLines: 1,
                maxLines: null,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(border: InputBorder.none),
                onSubmitted: (yeniDeger) {
                  if (yeniDeger.length > 3) {
                    widget.gorev.name = yeniDeger;
                    _localHafiza.gorevGuncelle(gorev: widget.gorev);
                  }
                },
              ),
        trailing:
            // intl.dart kütüphanesi ile gelen saat değerini istediğimiz değerleri almak için formatladık. Aşağıda saat ve dakika değerlerini alacak şekilde frmatladık.
            Text(
          DateFormat("hh:mm").format(widget.gorev.olusturmaZamani),
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ),
    );
  }
}
