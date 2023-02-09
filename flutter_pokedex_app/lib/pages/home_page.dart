import 'package:flutter/material.dart';
import 'package:flutter_pokedex_app/widgets/app_title.dart';
import 'package:flutter_pokedex_app/widgets/pokemon_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [AppTitle(), const Expanded(child: PokemonList())]),
    );
  }
}
