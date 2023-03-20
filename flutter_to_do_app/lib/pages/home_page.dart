import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_to_do_app/data/local_hafiza.dart';
import 'package:flutter_to_do_app/main.dart';
import 'package:flutter_to_do_app/models/gorev_model.dart';
import 'package:flutter_to_do_app/widgets/custom_search_delegate.dart';
import 'package:flutter_to_do_app/widgets/gorev_liste_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Gorev> _tumGorevler;
  late LocalHafiza _localHafiza;

  @override
  void initState() {
    super.initState();
    _localHafiza = locator<LocalHafiza>();
    _veriTabanindanGorevleriAl();
    _tumGorevler = <Gorev>[];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: const TextStyle(color: Colors.black),
        centerTitle: false,
        // AppBar yapısı ile Text üzerine tıklandğında da görev oluşturma yapısı açılır. GestureDetector ile yapı tıklanabilir hale getirilir.
        title: GestureDetector(
          onTap: () => _gorevEklemeEkranininGoster(context),
          child: const Text(
            "Bu gün Neler Yapacalsın ?",
            style: TextStyle(fontSize: 20),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                _showSearchPage();
              },
              icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                _gorevEklemeEkranininGoster(context);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: _tumGorevler.isNotEmpty
          ? ListView.builder(
              itemBuilder: (context, index) {
                var _oAnkiListeElemani = _tumGorevler[index];
                return Dismissible(
                    background: const Icon(
                      Icons.delete,
                      color: Colors.grey,
                    ),
                    key: Key(_oAnkiListeElemani.id),
                    onDismissed: (direction) {
                      _tumGorevler.removeAt(index);
                      _localHafiza.goreviSil(gorev: _oAnkiListeElemani);
                      setState(() {});
                    },
                    child: GorevItem(gorev: _oAnkiListeElemani));
              },
              itemCount: _tumGorevler.length,
            )
          : const Center(
              child: Text(
                "Henüz Bir Görev Eklemediniz...",
                style: TextStyle(fontSize: 20),
              ),
            ),
    );
  }

  void _gorevEklemeEkranininGoster(BuildContext context) {
    // Bu yapı uyarı ekranı gibi ekranın altında bir pencere oluşturur. Bu yapıya benzer bir yapı olan showBottomSheet yapısı ise tam ekran olacak şekilde benzer bir yapı çıkarır.
    // context için yapının kullanıldığı yerede bir context gönderilir ve burada kullanılabilmesi için BuildContext metodu ile context değişkeni oluşturulur.
    // Builder ise bir fonksiyon bekler. Bu fonksiyon içerisinde ise oluşması istenilen yapı return edilir.
    showModalBottomSheet(
        context: context,
        /* Builder içerisindeki yapı klavye ile yazı yazılabilen bir yapıdır. Bu nedenle bu yapıyı klavyeden kurtarabilmek ve dinamik bir yapı kazandırmak için yükseklik - genişlik 
        değerleri ile rahatlıkla oynanabilen Container yapısı içine almak daha doğrudur.
        */
        builder: (context) {
          return Container(
            /* viewInset yapısı klavye ile yapı arasında istenilen konuma göre boşluk bırakır. Bunu klavyenin bitiş noktasını referans alarak yapar. 
               bottom dediğimiz için yapının alt kısmını klavyeden uzaklaştırır.
            */
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            // Yazılan yazı kadar yapının genişlemesi için genişlik tanımlandı.
            width: MediaQuery.of(context).size.width,
            // ListTile yapısının shadow özelliğini kullanmak için TextField bu yapı ile sarmalandı.
            child: ListTile(
              title: TextField(
                autofocus: true,
                style: const TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                    hintText: "Yapılacak görevi giriniz...",
                    border: InputBorder.none),
                onSubmitted: (value) {
                  // Klavyeden onay butonuna basıldığında yapılacak işlemler aşağıda yer alır. Ana sayfaya dönme işlemi Navigator ile yapılır.
                  Navigator.of(context).pop();
                  // Kullanıcının girdiği değer eğer 3 karakterden büyükse saat seçme sekmesine gönderilir. Eğer 3'e eşit ve 3'ten küçükse ana sayfaya yönlendirilir.
                  if (value.length > 3) {
                    DatePicker.showTimePicker(
                      context,
                      showSecondsColumn: false,
                      onConfirm: (time) async {
                        var yeniEklenecelGorev =
                            Gorev.olustur(name: value, olusturmaZamani: time);
                        _tumGorevler.insert(0, yeniEklenecelGorev);
                        await _localHafiza.gorevEkle(gorev: yeniEklenecelGorev);
                        setState(() {});
                      },
                    );
                  }
                },
              ),
            ),
          );
        });
  }

/* Bu yapıyı biz init_state içinde çağırıyoruz fakat ek bir işlem olarak hive kullandığımız için await-async kullanmamız gerekmekte. init_state içinde ise bu yapıyı kullanamayız. 
   Hive kullanan yapıları burada oluşturup init_state içerisinde çağırmamız daha doğru olur.
*/
  void _veriTabanindanGorevleriAl() async {
    _tumGorevler = await _localHafiza.tumGorevleriAl();
    setState(() {});
  }

  void _showSearchPage() async {
    await showSearch(
        context: context,
        delegate: CustomSearchDelegate(tumGorevler: _tumGorevler));
    _veriTabanindanGorevleriAl();
  }
}
