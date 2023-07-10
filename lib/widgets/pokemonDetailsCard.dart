import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/Model/models.dart';
import 'package:pokedex/Screens/screens.dart';
import 'package:pokedex/Utils/utils.dart';
import 'package:pokedex/widgets/widgets.dart';

import '../database/localDatabase.dart';

class PokemonDetailsCard extends StatefulWidget {
  final String? pokemonId;
  final Function(FavouritePokemon) deleteCallback;
  const PokemonDetailsCard(
      {super.key, this.pokemonId, required this.deleteCallback});

  @override
  State<PokemonDetailsCard> createState() => _PokemonDetailsCardState();
}

class _PokemonDetailsCardState extends State<PokemonDetailsCard> {
  Pokemon? pokemon;

  List<Pokemon> listOfPokemon = [];

  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }

  fetchData() async {
    listOfPokemon = await loadJsonData();

    for (var element in listOfPokemon) {
      if (element.id == widget.pokemonId) {
        pokemon = element;
      }
    }
    return pokemon;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GestureDetector(
            onTap: () {
              // Get.to(() => PokemonDetails(pokemon: pokemon));

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PokemonDetails(
                      pokemon: pokemon, deleteCallback: widget.deleteCallback),
                ),
              );
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  height: ScreenSize.screenHeight(context) * 0.1,
                  width: ScreenSize.screenWidth(context),
                  child: Card(
                    color: getTypeColor(pokemon!.typeofpokemon![0])
                        .withOpacity(0.1),
                    elevation: Sizes.HEIGHT_10,
                    shadowColor: getTypeColor(pokemon!.typeofpokemon![0])
                        .withOpacity(0.1),
                    child: Text(pokemon!.name!, style: headingBold),
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: CacheImage(
                    imageUrl: pokemon!.imageurl!,
                  ),
                ),
              ],
            ),
            // ),
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
