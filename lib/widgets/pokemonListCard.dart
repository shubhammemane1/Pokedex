import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/Model/models.dart';
import 'package:pokedex/Screens/pokemonDetails.dart';
import 'package:pokedex/Utils/utils.dart';

class PokemonListCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonListCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.to(() => PokemonDetails(pokemon: pokemon));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PokemonDetails(pokemon: pokemon),
          ),
        );
      },
      child: Hero(
        tag: pokemon.id.toString(),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            SizedBox(
              height: ScreenSize.screenHeight(context) * 0.1,
              width: ScreenSize.screenWidth(context),
              child: Card(
                color: getTypeColor(pokemon.typeofpokemon![0]).withOpacity(0.1),
                elevation: Sizes.HEIGHT_10,
                shadowColor:
                    getTypeColor(pokemon.typeofpokemon![0]).withOpacity(0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SpaceH16(),
                    Padding(
                      padding: const EdgeInsets.only(left: Sizes.WIDTH_8),
                      child: Text(pokemon.name!, style: headingBold),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                alignment: Alignment.topRight,
                child: Image(
                  image: NetworkImage(
                    pokemon.imageurl!,
                  ),
                  height: ScreenSize.screenHeight(context) * 0.15,
                )),
          ],
        ),
      ),
    );
  }
}
