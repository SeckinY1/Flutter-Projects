import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_to_do_app/data/local_hafiza.dart';
import 'package:flutter_to_do_app/pages/home_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'models/gorev_model.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerSingleton<LocalHafiza>(HiveLocalHafiza());
}

Future<void> setupHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(GorevAdapter());
  var gorevBox = await Hive.openBox<Gorev>('gorevler');
  for (var element in gorevBox.values) {
    if (element.olusturmaZamani.day != DateTime.now().day) {
      gorevBox.delete(element.id);
    }
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Telefonun bildirim çubuğunun arka plan rengini belirlemek için kullanılan yapıdır.
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  await setupHive();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          // Uygulamada kullanılacak olan sayfaların appBar rengini buardan default olarak ayarlayabiliriz.
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          )),
      home: MyHomePage(),
    );
  }
}
