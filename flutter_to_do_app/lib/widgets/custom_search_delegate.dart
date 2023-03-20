import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/data/local_hafiza.dart';
import 'package:flutter_to_do_app/main.dart';
import 'package:flutter_to_do_app/models/gorev_model.dart';

import 'gorev_liste_item.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List<Gorev> tumGorevler;

  CustomSearchDelegate({required this.tumGorevler});

  // Bu yapı arama kısmının sağ tarafındaki ikonları arayüze yansıttığımız bölümdür.
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            // query yapısı, kullanıcının girdiği değeri belirtir ve her yerde erişilebilir bir yapıdır.
            query.isEmpty ? null : query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  // Bu yapı arama kısmının en başındaki ikonları arayüze yansıttığımız bölümdür.
  @override
  Widget? buildLeading(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // close yapısı da query gibi her yerden erişilebilir bir yapıdır. SearchDelegate sınıfından gelir. içindeki result değeri açılan sayfaya göndermek istediğimiz değeri söyler.
          close(context, null);
        },
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 24,
        ));
  }

  // Bu yapı arama yaparken çıkacak olan sonuçları nasıl göstermek istediğimizi arayüze yansıttığımız bölümdür.
  @override
  Widget buildResults(BuildContext context) {
    List<Gorev> _filtreliListe = tumGorevler
        .where(
            (gorev) => gorev.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return _filtreliListe.length > 0
        ? ListView.builder(
            itemBuilder: (context, index) {
              var _oAnkiListeElemani = _filtreliListe[index];
              return Dismissible(
                  background: const Icon(
                    Icons.delete,
                    color: Colors.grey,
                  ),
                  key: Key(_oAnkiListeElemani.id),
                  onDismissed: (direction) async {
                    _filtreliListe.removeAt(index);
                    await locator<LocalHafiza>()
                        .goreviSil(gorev: _oAnkiListeElemani);
                  },
                  child: GorevItem(gorev: _oAnkiListeElemani));
            },
            itemCount: _filtreliListe.length,
          )
        : const Center(
            child: Text("Aradığınız görev bulunamadı.."),
          );
  }

  // Bu yapı kullanıcı bir karakter, iki karakter yada rakam girdiğinde görünmesini istediğimiz sonuçları arayüze yansıttığımız bölümdür.
  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
