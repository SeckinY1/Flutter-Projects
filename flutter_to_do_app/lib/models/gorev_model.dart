// Bu kütüphane ile istediğimiz yapılara göre farklı sayılar - String türünde keyler elde edebiliriz.
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
part 'gorev_model.g.dart';

@HiveType(typeId: 1)
class Gorev extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  final DateTime olusturmaZamani;

  @HiveField(3)
  bool tamamlandiMi;

  Gorev(
      {required this.id,
      required this.name,
      required this.olusturmaZamani,
      required this.tamamlandiMi});

  // Ypaının factory ile oluşturulma nedeni Kurucuların değer döndürememsidir. Bu nedenle kurucu metot burda yeniden yapılandırılarak değer döndüren hale getirilmiştir.
  factory Gorev.olustur(
      {required String name, required DateTime olusturmaZamani}) {
    return Gorev(
        // Id saat değerine göre olşturulacak ve kullanıcıdan gelen saate bağlı olarak otomatik oluşturulacak. v1 metodu ise saat değerini bize String ifade olarak
        id: const Uuid().v1(),
        name: name,
        olusturmaZamani: olusturmaZamani,
        tamamlandiMi: false);
  }
}
