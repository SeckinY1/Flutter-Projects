import 'package:burc_rehberi/burc_yonlendirme_ekrani.dart';
import 'package:flutter/material.dart';

import 'model/burc.dart';

class BurcItem extends StatelessWidget {
  final Burc listelenenBurc;
  const BurcItem({Key? key, required this.listelenenBurc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          YonlendirmeEkrani(secilenBurc: listelenenBurc)));
            },
            leading: Image.asset("images/${listelenenBurc.burcKucukResmi}"),
            title: Text(listelenenBurc.burcAdi),
            subtitle: Text(listelenenBurc.burcTarihi),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.pink,
            ),
          ),
        ),
      ),
    );
  }
}
