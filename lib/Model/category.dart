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
    categoryName: "Moves",
    categoryColor: getTypeColor("fighting"),
    nextScreen: PokemonListingScreen(),
    categoryIcon: AssetsPath.fighting,
    heroTag: "moves",
  ),
  Category(
    categoryName: "Evolution",
    categoryColor: getTypeColor("poison"),
    nextScreen: PokemonListingScreen(),
    categoryIcon: AssetsPath.poison,
    heroTag: "Evolution",
  ),
  Category(
    categoryName: "Category",
    categoryColor:getTypeColor("dragon"),
    nextScreen: PokemonListingScreen(),
    categoryIcon: AssetsPath.dragon,
    heroTag: "Category",
  ),
];
