import 'package:flutter_to_do_app/models/gorev_model.dart';
import 'package:hive/hive.dart';

abstract class LocalHafiza {
  Future<void> gorevEkle({required Gorev gorev});
  Future<Gorev?> gorevAl({required String id});
  Future<List<Gorev>> tumGorevleriAl();
  Future<bool> goreviSil({required Gorev gorev});
  Future<Gorev> gorevGuncelle({required Gorev gorev});
}

class HiveLocalHafiza extends LocalHafiza {
  late Box<Gorev> _gorevBox;

  HiveLocalHafiza() {
    _gorevBox = Hive.box<Gorev>('gorevler');
  }
  @override
  Future<Gorev?> gorevAl({required String id}) async {
    if (_gorevBox.containsKey(id)) {
      return _gorevBox.get(id);
    } else {
      return null;
    }
  }

  @override
  Future<void> gorevEkle({required Gorev gorev}) async {
    await _gorevBox.put(gorev.id, gorev);
  }

  @override
  Future<Gorev> gorevGuncelle({required Gorev gorev}) async {
    await gorev.save();
    return gorev;
  }

  @override
  Future<bool> goreviSil({required Gorev gorev}) async {
    await gorev.delete();
    return true;
  }

  @override
  Future<List<Gorev>> tumGorevleriAl() async {
    List<Gorev> _tumGorevler = <Gorev>[];
    _tumGorevler = _gorevBox.values.toList();

    if (_tumGorevler.isNotEmpty) {
      _tumGorevler.sort(
          (Gorev a, Gorev b) => b.olusturmaZamani.compareTo(a.olusturmaZamani));
    }
    return _tumGorevler;
  }
}
