// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:pokedex/Model/models.dart';

import '../Utils/utils.dart';

class PokemonCard extends StatefulWidget {
  final String? pokemonID;
  const PokemonCard({super.key, required this.pokemonID});

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  Pokemon? pokemon;

  late List<Pokemon> listOfPokemon;

  @override
  void initState() {

    fetchData();
    super.initState();
  }

  fetchData() async {
    listOfPokemon = await loadJsonData();

    for (var element in listOfPokemon) {
      if (element.id == widget.pokemonID) {
        return pokemon = element;
      }
    }
    return pokemon;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: ScreenSize.screenHeight(context) * 0.1,
          width: ScreenSize.screenWidth(context),
          child: Card(
            elevation: Sizes.HEIGHT_10,
            shadowColor:
                getTypeColor(pokemon!.typeofpokemon![0]).withOpacity(0.1),
            child: Text(pokemon!.name!, style: headingBold),
          ),
        ),
        Container(
            alignment: Alignment.topRight,
            child: Image(
              image: NetworkImage(
                pokemon!.imageurl!,
              ),
            )),
      ],
    );
  }
}
