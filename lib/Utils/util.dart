import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:pokedex/Model/models.dart';

import 'utils.dart';

String getEnumValue(e) => e.toString().split('.').last;

 loadJsonData() async {
  var jsonString = await rootBundle.loadString('assets/json/data.json');

  var data = jsonDecode(jsonString);

  List<Pokemon> listOfPokemon = [];
  for (var element in data) {
    listOfPokemon.add(Pokemon.fromJson(element));
  }

  return listOfPokemon;
}

Color getTypeColor(String? type) {
  switch (type!.toLowerCase()) {
    case "grass":
      return AppColors.grass;
    case "fire":
      return AppColors.fire;
    case "water":
      return AppColors.water;
    case "electric":
      return AppColors.electric;
    case "psychic":
      return AppColors.psychic;
    case "fighting":
      return AppColors.fighting;
    case "flying":
      return AppColors.flying;
    case "poison":
      return AppColors.poison;
    case "ground":
      return AppColors.ground;
    case "rock":
      return AppColors.rock;
    case "bug":
      return AppColors.bug;
    case "ice":
      return AppColors.ice;
    case "ghost":
      return AppColors.ghost;
    case "dark":
      return AppColors.dark;
    case "steel":
      return AppColors.steel;
    case "dragon":
      return AppColors.dragon;
    case "normal":
      return AppColors.normal;
    default:
      return AppColors.normal;
  }
}

String getTypeIcon(String type) {
  switch (type.toLowerCase()) {
    case "grass":
      return AssetsPath.grass;
    case "fire":
      return AssetsPath.fire;
    case "water":
      return AssetsPath.water;
    case "electric":
      return AssetsPath.electric;
    case "psychic":
      return AssetsPath.psychic;
    case "fighting":
      return AssetsPath.fighting;
    case "flying":
      return AssetsPath.flying;
    case "poison":
      return AssetsPath.poison;
    case "ground":
      return AssetsPath.ground;
    case "rock":
      return AssetsPath.rock;
    case "bug":
      return AssetsPath.bug;
    case "ice":
      return AssetsPath.ice;
    case "ghost":
      return AssetsPath.ghost;
    case "dark":
      return AssetsPath.dark;
    case "steel":
      return AssetsPath.steel;
    case "dragon":
      return AssetsPath.dragon;
    case "normal":
      return AssetsPath.normal;
    default:
      return AssetsPath.normal;
  }
}
