import 'package:dinamik_ortalama_hesaplama/data/data_helper.dart';
import 'package:dinamik_ortalama_hesaplama/model/dersler.dart';
import 'package:dinamik_ortalama_hesaplama/sabitler.dart';
import 'package:flutter/material.dart';

class DersListesi extends StatelessWidget {
  Function onDismiss;
  DersListesi({required this.onDismiss, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;

    return tumDersler.length > 0
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: ((context, index) {
              return Dismissible(
                // Kaybolmasını istediğimiz yapıları bu yapı içine alırız. Aşağıdaki Padding Widget' i Card yapısı ile bağlantılı olduğu için Paddingi de bu yapı ile sarmalamalıyız
                key: UniqueKey(),
                /* Dismissible bizden silinen yapıyı anlamak için key değeri bekler. key yapısına atanan değer oluşturulan tüm yapılar için kullanılır. Örneğin key:1 dersek tüm oluşturulan yaıların key değeri 1 olur. 
                                   Rastgele key oluşturmak için UniqueKey() yapısını kullanırız.*/
                direction: DismissDirection
                    .startToEnd, // Yapı silinirken nereye kaydırılarak silineceğini gösterir.
                onDismissed: (direction) {
                  //Bu yapı kullanıldığında yapılması istenilen işlemler buraya yazılır.
                  onDismiss(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(tumDersler[index].ad),
                      leading: CircleAvatar(
                        backgroundColor: Sabitler.anaRenk,
                        child: Text((tumDersler[index].krediDegeri *
                                tumDersler[index].harfDegeri)
                            .toStringAsFixed(0)),
                      ),
                      subtitle: Text(
                          "${tumDersler[index].krediDegeri} Kredi, Alınan Not ${tumDersler[index].harfDegeri}"),
                    ),
                  ),
                ),
              );
            }))
        : Container(
            child: Center(
                child: Text(
              "Lütfen Ders Giriniz",
              style: Sabitler.baslikYapisi,
            )),
          );
  }
}
