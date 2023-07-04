import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_img/flutter_img.dart';
import 'package:pokedex/Model/models.dart';
import 'package:pokedex/Utils/logs.dart';
import 'package:pokedex/Utils/util.dart';
import 'package:pokedex/repository/repository.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // PokeHub? pokeHub;
  @override
  void initState() {
    // TODO: implement initState
    // fetchData();
    super.initState();
  }

  // fetchData() async {
  //   var res = await http.get(Uri.parse(
  //       "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json"));

  //   var descodedJSon = jsonDecode(res.body);

  //   return pokeHub = PokeHub.fromJson(descodedJSon);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: loadJsonData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasData) {
          List<Pokemon> listOfPokemon = snapshot.data!;
          return ListView.builder(
            itemCount: listOfPokemon.length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(listOfPokemon[index].imageurl!),
                        ),
                      ),
                    ),
                    Text(listOfPokemon[index].name!),
                  ],
                ),
              );
            },
          );
        }
        return CircularProgressIndicator();
      },
    ));
  }
}
