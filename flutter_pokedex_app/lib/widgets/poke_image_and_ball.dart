import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex_app/constants/ui_helper.dart';
import 'package:flutter_pokedex_app/model/pokemon_model.dart';

class PokeImagesAndBall extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeImagesAndBall({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pokeballImagesUrl = "images/pokeball.png";

    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            pokeballImagesUrl,
            width: UIHelper.calculatePokeImageAndBallSize(),
            height: UIHelper.calculatePokeImageAndBallSize(),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: pokemon.id!,
            child: CachedNetworkImage(
              imageUrl: pokemon.img ?? "",
              errorWidget: (context, url, error) => Icon(Icons.ac_unit),
              width: UIHelper.calculatePokeImageAndBallSize(),
              height: UIHelper.calculatePokeImageAndBallSize(),
              placeholder: (context, url) => const CircularProgressIndicator(
                color: Colors.red,
              ),
            ),
          ),
        )
      ],
    );
  }
}
