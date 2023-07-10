import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pokedex/Model/models.dart';
import 'package:pokedex/Utils/utils.dart';
import 'package:pokedex/database/localDatabase.dart';
import 'package:pokedex/widgets/widgets.dart';

class FavouritePokemonScreen extends StatefulWidget {
  const FavouritePokemonScreen({super.key});

  @override
  State<FavouritePokemonScreen> createState() => _FavouritePokemonScreenState();
}

class _FavouritePokemonScreenState extends State<FavouritePokemonScreen> {
  List<FavouritePokemon> listoFSavedPokemon = [];
  List<Pokemon> listofPokemon = [];
  late Future<List<Pokemon>> fetchDataFuture;

  @override
  void initState() {
    fetchDataFuture = fetchData();
    super.initState();
  }

  Future<List<Pokemon>> fetchData() async {
    listoFSavedPokemon = await LocalDataBaseHelper().fetchPokemon();

    List<Pokemon> listOfApiData = await loadJsonData();

    for (var record1 in listOfApiData) {
      for (var record2 in listoFSavedPokemon) {
        if (record1.id == record2.pokemonId) {
          listofPokemon.add(record1);
        }
      }
    }
    return listofPokemon;
  }

  @override
  void dispose() {
    listofPokemon.clear();
    super.dispose();
  }

  // @override
  // void didChangeDependencies() {
  //   fetchDataFuture = fetchData();
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  // }

  void deleteData(FavouritePokemon data) async {
    // Perform deletion action on the second page

    // Delete the data from the local database
    await LocalDataBaseHelper().deletePokemon(data);

    // Update the list on the first page
    await fetchData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.transperent,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Get.isDarkMode ? AppColors.grey100 : AppColors.black,
            ),
          ),
          title: Text(
            AppConstants.favouritePokemon,
            style: TextStyle(
              color: Get.isDarkMode ? AppColors.grey100 : AppColors.black,
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.WIDTH_8),
          child: FutureBuilder(
            future: fetchDataFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.data!.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: const AssetImage("assets/images/notFound.png"),
                      height: ScreenSize.screenHeight(context) * .3,
                      width: ScreenSize.screenWidth(context),
                    ),
                    SpaceH20(),
                    Text(
                      "Add Some ${AppConstants.pokemon}!",
                      style: subTitleBold!.copyWith(
                        color: AppColors.categoryRed,
                        fontSize: Sizes.TEXT_SIZE_30,
                      ),
                    )
                  ],
                );
              }
              if (snapshot.hasData) {
                return GridView.builder(
                  itemCount: listofPokemon.length,
                  itemBuilder: (context, index) {
                    return PokemonListCard(
                      pokemon: listofPokemon[index],
                      deleteCallback: deleteData,
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                  ),
                );
              }

              return const Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}
