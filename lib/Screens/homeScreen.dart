import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/Model/category.dart';
import 'package:pokedex/Model/models.dart';
import 'package:pokedex/Utils/utils.dart';
import 'package:pokedex/widgets/widgets.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppColors.transperent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AssetsPath.pokeball,
                scale: 15,
              ),
              SpaceW12(),
              Text(
                AppConstants.APP_NAME,
                style: TextStyle(
                  color: Get.isDarkMode ? AppColors.grey100 : AppColors.black,
                ),
              ),
            ],
          )),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(
              AssetsPath.pokedex,
            ),
            scale: 2.5,
            colorFilter: ColorFilter.mode(
                AppColors.black.withOpacity(0.3), BlendMode.modulate),
            alignment: Alignment.topRight,
            opacity: 0.3,
          ),
        ),
        padding: const EdgeInsets.all(Sizes.WIDTH_12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SpaceH40(),
              SpaceH40(),
              SpaceH40(),
              const Text(
                AppConstants.What_Pokemon_Your_Looking_For,
                style: TextStyle(fontSize: Sizes.TEXT_SIZE_32),
              ),
              SpaceH20(),
              const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search Pokemon"),
              ),
              SpaceH30(),
              SizedBox(
                width: ScreenSize.screenWidth(context) * 0.9,
                child: GridView.builder(
                  itemCount: listOfCategory.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 4.5 / 3,
                    mainAxisSpacing: 5,
                  ),
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      category: listOfCategory[index],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


// FutureBuilder(
//       future: loadJsonData(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const CircularProgressIndicator();
//         } else if (snapshot.hasData) {
//           List<Pokemon> listOfPokemon = snapshot.data!;
//           return ListView.builder(
//             itemCount: listOfPokemon.length,
//             itemBuilder: (context, index) {
//               return Card(
//                 child: Column(
//                   children: [
//                     Container(
//                       height: 200,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: NetworkImage(listOfPokemon[index].imageurl!),
//                         ),
//                       ),
//                     ),
//                     Text(listOfPokemon[index].imageurl!),
//                     Text(listOfPokemon[index].name!),
//                   ],
//                 ),
//               );
//             },
//           );
//         }
//         return const CircularProgressIndicator();
//       },
//     )