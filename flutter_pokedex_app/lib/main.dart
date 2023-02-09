import 'package:flutter/material.dart';
import 'package:flutter_pokedex_app/pages/home_page.dart';
import 'package:flutter_pokedex_app/services/pokedex_api.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    PokeApi.getPokemonData();
    return ScreenUtilInit(
      designSize: const Size(393, 808),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Pokedex",
        theme: ThemeData.dark(),
        home: const HomePage(),
      ),
    );
  }
}
