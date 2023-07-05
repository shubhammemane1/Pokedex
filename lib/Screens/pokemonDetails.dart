// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pokedex/Model/models.dart';
import 'package:pokedex/Utils/utils.dart';
import 'package:pokedex/widgets/widgets.dart';

Pokemon pokemonData = Pokemon(
    name: "Bulbasaur",
    id: "#001",
    imageurl: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png",
    xdescription:
        "Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun's rays, the seed grows progressively larger.",
    ydescription:
        "Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun's rays, the seed grows progressively larger.",
    height: "2' 04\"",
    category: "Seed",
    weight: "15.2 lbs",
    typeofpokemon: ["Grass", "Poison"],
    weaknesses: ["Fire", "Flying", "Ice", "Psychic"],
    evolutions: ["#001", "#002", "#003"],
    abilities: ["Overgrow"],
    hp: 20,
    attack: 30,
    defense: 20,
    specialAttack: 30,
    specialDefense: 30,
    speed: 30,
    total: 160,
    malePercentage: "87.5%",
    femalePercentage: "12.5%",
    genderless: 0,
    cycles: "20 ",
    eggGroups: "Grass, Monster ",
    evolvedfrom: "",
    reason: "",
    baseExp: "64");

class PokemonDetails extends StatefulWidget {
  Pokemon? pokemon = pokemonData;
  // const PokemonDetails({super.key, this.pokemon});

  @override
  State<PokemonDetails> createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(
      initialIndex: 1,
      length: 4,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.transperent,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          widget.pokemon!.id!,
          style: TextStyle(
            color: AppColors.black,
          ),
        ),
        actions: [
          Icon(Icons.favorite_border_outlined, color: AppColors.black),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.pokemon!.imageurl!,
                        scale: 1.5,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
                      child: Image(
                        image: NetworkImage(
                          widget.pokemon!.imageurl!,
                          scale: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              widget.pokemon!.name!,
              style: TextStyle(
                fontSize: Sizes.TEXT_SIZE_30,
                fontWeight: FontWeight.w700,
              ),
            ),
            SpaceH8(),
            Text(
              "${widget.pokemon!.category!}  ${AppConstants.pokemon}",
              style: headingMedium,
            ),
            Container(
              width: ScreenSize.screenWidth(context) * 0.95,
              height: ScreenSize.screenHeight(context) * 0.08,
              padding: EdgeInsets.symmetric(vertical: Sizes.ELEVATION_16),
              alignment: Alignment.center,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.pokemon!.typeofpokemon!.length,
                itemBuilder: (context, index) {
                  return MyChips(
                    name: widget.pokemon!.typeofpokemon![index],
                  );
                },
              ),
            ),
            Container(
              child: Column(
                children: [
                  TabBar(
                    controller: _tabController,
                    labelColor: AppColors.white,
                    indicatorColor: AppColors.primaryColor,
                    tabs: const [
                      Tab(
                        text: "About",
                      ),
                      Tab(
                        text: "Stats",
                      ),
                      Tab(
                        text: "Moves",
                      ),
                      Tab(
                        text: "Evolutions",
                      ),
                    ],
                  ),
                  SizedBox(
                    // color: AppColors.black,
                    height: ScreenSize.screenHeight(context) * 0.31,
                    width: ScreenSize.screenWidth(context) * 0.98,
                    child: TabBarView(controller: _tabController, children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Text(
                              widget.pokemon!.xdescription!,
                              style: TextStyle(fontSize: Sizes.TEXT_SIZE_16),
                            ),
                            SpaceH16(),
                            Card(
                              margin: EdgeInsets.all(Sizes.HEIGHT_16),
                              child: Container(
                                padding: EdgeInsets.all(Sizes.HEIGHT_16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        RotatedBox(
                                          quarterTurns: 1,
                                          child: Icon(
                                            Icons.straighten_rounded,
                                          ),
                                        ),
                                        Text(widget.pokemon!.height!),
                                      ],
                                    ),
                                    Container(
                                      height: 20,
                                      width: 1,
                                      color: AppColors.black,
                                    ),
                                    Row(
                                      children: [
                                        RotatedBox(
                                          quarterTurns: 0,
                                          child: Icon(
                                            Icons.punch_clock_outlined,
                                          ),
                                        ),
                                        Text(widget.pokemon!.height!),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                          // height: ScreenSize.screenHeight(context) * 0.02,
                          padding: EdgeInsets.only(
                            top: 16,
                            left: 16,
                            right: 16,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                getProgressData(
                                    context,
                                    "hp",
                                    widget.pokemon!.hp!,
                                    getTypeColor(
                                        widget.pokemon!.typeofpokemon![0])),
                                getProgressData(
                                    context,
                                    "Attack",
                                    widget.pokemon!.attack!,
                                    getTypeColor(
                                        widget.pokemon!.typeofpokemon![0])),
                                getProgressData(
                                    context,
                                    "Defense",
                                    widget.pokemon!.defense!,
                                    getTypeColor(
                                        widget.pokemon!.typeofpokemon![0])),
                                getProgressData(
                                    context,
                                    "Special Attack",
                                    widget.pokemon!.specialAttack!,
                                    getTypeColor(
                                        widget.pokemon!.typeofpokemon![0])),
                                getProgressData(
                                    context,
                                    "Special Defense",
                                    widget.pokemon!.specialDefense!,
                                    getTypeColor(
                                        widget.pokemon!.typeofpokemon![0])),
                                getProgressData(
                                    context,
                                    "Speed",
                                    widget.pokemon!.speed!,
                                    getTypeColor(
                                        widget.pokemon!.typeofpokemon![0])),
                              ],
                            ),
                          )),
                      Container(),
                      Container(
                          child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 5 / 3,
                          // mainAxisSpacing: 5,
                        ),
                        itemCount: widget.pokemon!.evolutions!.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Container(
                                height: ScreenSize.screenHeight(context) * 0.1,
                                width: ScreenSize.screenWidth(context),
                                child: Card(
                                  elevation: Sizes.HEIGHT_10,
                                  shadowColor: getTypeColor(widget.pokemon!.typeofpokemon![0]).withOpacity(0.1),
                                  child: Text(
                                      widget.pokemon!.evolutions![index],
                                      style: headingBold),
                                ),
                              ),
                              Container(
                                  alignment: Alignment.topRight,
                                  child: Image(
                                    image: NetworkImage(
                                      widget.pokemon!.imageurl!,
                                    ),
                                  )),
                            ],
                          );
                        },
                      )

                          // ListView.builder(
                          //   itemCount: widget.pokemon!.evolutions!.length,
                          //   itemBuilder: (context, index) {
                          // return Card(
                          //   child: Text(widget.pokemon!.evolutions![index]),
                          // );
                          //   },
                          // ),
                          ),
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget getProgressData(
    BuildContext context, String statsName, int statsData, Color statsColor) {
  return SizedBox(
    height: ScreenSize.screenHeight(context) * 0.045,
    width: ScreenSize.screenWidth(context) * 0.95,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 7,
          child: Text(
            statsName,
            style: subHeadingMedium!.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
        Text(statsData.toString()),
        Container(
          width: ScreenSize.screenWidth(context) * 0.55,
          padding: const EdgeInsets.only(left: 15.0),
          child: LinearProgressIndicator(
            backgroundColor: statsColor.withOpacity(0.1),
            valueColor: AlwaysStoppedAnimation(statsColor),
            value: statsData.toDouble() / 100,
            minHeight: 5,
          ),
        ),
      ],
    ),
  );
}
