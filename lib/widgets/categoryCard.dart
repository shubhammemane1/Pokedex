import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/Model/models.dart';
import 'package:pokedex/Screens/pokemonListingScreen.dart';
import 'package:pokedex/Screens/screens.dart';
import 'package:pokedex/Utils/utils.dart';

class CategoryCard extends StatelessWidget {
  final Category? category;
  const CategoryCard({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => PokemonCategoryScreen());
      },
      child: Hero(
        tag: category!.heroTag!,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ListView(
              children: [
                SpaceH30(),
                SizedBox(
                  width: ScreenSize.screenWidth(context),
                  height: ScreenSize.screenWidth(context) * 0.2,
                  child: Card(
                    color: category!.categoryColor!.withOpacity(0.8),
                    shadowColor: category!.categoryColor!.withOpacity(0.5),
                    elevation: 10,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.ELEVATION_12),
                      decoration: BoxDecoration(
                    // color: category!.categoryColor!.withOpacity(0.1),
                        // color: AppColors.transperent,
                        gradient: LinearGradient(
                          colors: [
                            AppColors.white.withOpacity(0.1),
                            AppColors.white.withOpacity(0.5),
                          ],
                          begin: Alignment.centerRight,
                          end: Alignment.topLeft,
                          // tileMode: TileMode.mirror,
                        ),
                      ),
                      child: Container(
                        child: Text(
                          category!.categoryName!,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: Sizes.TEXT_SIZE_16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
                alignment: Alignment.topRight,
                child: Image(
                  image: AssetImage(
                    category!.categoryIcon!,
                  ),
                  height: Sizes.HEIGHT_70,
                )),
          ],
        ),
      ),
    );
  }
}
