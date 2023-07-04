import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:pokedex/Model/models.dart';

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
