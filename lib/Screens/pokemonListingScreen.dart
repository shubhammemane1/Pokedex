// ignore_for_file: camel_case_types, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/Model/models.dart';
import 'package:pokedex/Utils/utils.dart';
import 'package:pokedex/widgets/widgets.dart';

class PokemonListingScreen extends StatelessWidget {
  List<Pokemon> listOfPokemon = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.transperent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Get.isDarkMode ? AppColors.grey100 : AppColors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.WIDTH_8),
        child: Column(
          children: [
            Hero(
              tag: AppConstants.APP_NAME,
              child: Container(
                child: Text(
                  AppConstants.APP_NAME,
                  style: subTitleBold!.copyWith(
                    fontSize: Sizes.TEXT_SIZE_30,
                    color: Get.isDarkMode ? AppColors.white : AppColors.grey550,
                  ),
                ),
              ),
            ),
            Container(
              height: ScreenSize.screenHeight(context) * 0.9,
              child: FutureBuilder(
                future: loadJsonData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    listOfPokemon = snapshot.data as List<Pokemon>;
                    return GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 6 / 4),
                      itemCount: listOfPokemon.length,
                      itemBuilder: (context, index) {
                        return PokemonListCard(
                          pokemon: listOfPokemon[index],
                        );
                      },
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
