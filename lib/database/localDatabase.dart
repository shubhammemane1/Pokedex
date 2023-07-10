// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:pokedex/Model/models.dart';
import 'package:pokedex/Screens/pokemonDetails.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class FavouritePokemon {
  // String? id;
  String? pokemonId;

  FavouritePokemon({this.pokemonId});

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    // map["id"] = id;
    map["pokemonId"] = pokemonId;
    return map;
  }

  //to be used when converting the row into object
  factory FavouritePokemon.fromMap(Map<String, dynamic> data) =>
      FavouritePokemon(pokemonId: data['pokemonId']);
}

class LocalDataBaseHelper {
  static var localDatabase;

  static connect() async {
    localDatabase = await openDatabase(
      'local_dataBase.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE favouritePokemon( pokemonId TEXT);
        ''');
      },
    );
    print("dataBase is Created");
  }

  Future<bool> checkIfDatabaseExists() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'local_dataBase.db');
    return await databaseExists(path);
  }

  Future<int> insertUser({FavouritePokemon? pokemonID}) async {
    int result = await localDatabase.insert(
      "favouritePokemon",
      pokemonID!.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print("result : ${result.toString()}");
    return result;
  }

  fetchPokemon() async {
    final List<Map<String, dynamic>> records =
        await localDatabase.query('favouritePokemon');

    final List<FavouritePokemon> pokemonList = records.map((record) {
      return FavouritePokemon(
        pokemonId: record['pokemonId'],
      );
    }).toList();

    for (final pokemon in pokemonList) {
      print(pokemon.pokemonId);
    }
    return pokemonList;
  }

  deletePokemon(FavouritePokemon pokemon) async {
    final List<Map<String, dynamic>> records =
        await localDatabase.query('favouritePokemon');
    records.forEach((id) async {
      await localDatabase.delete(
        'favouritePokemon',
        where: 'pokemonId = ?',
        whereArgs: [pokemon.pokemonId],
      );
    });
  }
}
