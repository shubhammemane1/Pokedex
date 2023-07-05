import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:pokedex/Model/models.dart';

import 'utils.dart';

String getEnumValue(e) => e.toString().split('.').last;

Future<List<Pokemon>> loadJsonData() async {
  var jsonString = await rootBundle.loadString('assets/json/data.json');

  var data = jsonDecode(jsonString);

  List<Pokemon> listOfPokemon = [];
  for (var element in data) {
    listOfPokemon.add(Pokemon.fromJson(element));
  }

  return listOfPokemon;
}

Color getTypeColor(String Type) {
  switch (Type.toLowerCase()) {
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
