import 'package:flutter/material.dart';
import 'package:pokedex/Screens/screens.dart';
import 'package:pokedex/Utils/utils.dart';

class Category {
  final String? categoryName;
  final String? categoryIcon;
  final Color? categoryColor;
  final Widget? nextScreen;
  final String? heroTag;

  Category({
    this.categoryName,
    this.categoryIcon,
    this.categoryColor,
    this.nextScreen,
    this.heroTag,
  });
}

List<Category> listOfCategory = [
  Category(
    categoryName: AppConstants.APP_NAME,
    categoryColor: getTypeColor("electric"),
    nextScreen: PokemonListingScreen(),
    categoryIcon: AssetsPath.electric,
    heroTag: AppConstants.APP_NAME,
  ),
  Category(
    categoryName: "Category",
    categoryColor: getTypeColor("fire"),
    nextScreen: const PokemonCategoryScreen(),
    categoryIcon: AssetsPath.dragon,
    heroTag: "Evolution",
  ),
  Category(
    categoryName: AppConstants.favouritePokemon,
    categoryColor: getTypeColor("water"),
    nextScreen: const FavouritePokemonScreen(),
    categoryIcon: AssetsPath.ice,
    heroTag: "Category",
  ),
];
