import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/Model/models.dart';
import 'package:pokedex/Screens/pokemonDetails.dart';
import 'package:pokedex/Utils/utils.dart';
import 'package:pokedex/database/localDatabase.dart';
import 'package:pokedex/widgets/cachedNetworkImage.dart';

class PokemonListCard extends StatelessWidget {
  final Pokemon pokemon;
  final Function(FavouritePokemon)? deleteCallback;
  const PokemonListCard({super.key, required this.pokemon,  this.deleteCallback});

  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.to(() => PokemonDetails(pokemon: pokemon));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PokemonDetails(pokemon: pokemon, deleteCallback: deleteCallback,),
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
              height: ScreenSize.screenHeight(context) * 0.15,
              child: CacheImage(
                imageUrl: pokemon.imageurl!,
              ),
              //  Image(
              //   image: NetworkImage(
              //     pokemon.imageurl!,
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
