// // ignore_for_file: file_names

// import 'package:flutter/material.dart';
// import 'package:pokedex/Utils/utils.dart';
// import 'package:pokedex/widgets/widgets.dart';

// import '../Model/models.dart';

// class PokemonListingScreen extends StatefulWidget {
//   const PokemonListingScreen({super.key});

//   @override
//   State<PokemonListingScreen> createState() => _PokemonListingScreenState();
// }

// class _PokemonListingScreenState extends State<PokemonListingScreen> {
//   late List<Pokemon> listOfPokemon;

//   @override
//   void initState() {
//     // TODO: implement initState
//     fetchData();
//     super.initState();
//   }

//   fetchData() async {
//     listOfPokemon = await loadJsonData();
//     logs(listOfPokemon.length.toString());
//     return listOfPokemon;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: AppColors.transperent,
//         leading: IconButton(
//           onPressed: () {},
//           icon: const Icon(Icons.arrow_back_ios_new_rounded),
//         ),
//       ),
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(
//                 horizontal: Sizes.WIDTH_16, vertical: Sizes.HEIGHT_16),
//             child: Column(
//               children: [
//                 Text(
//                   AppConstants.APP_NAME,
//                   style: subTitleBold!.copyWith(
//                     fontSize: Sizes.TEXT_SIZE_30,
//                   ),
//                 ),
//                 Container(
//                     width: ScreenSize.screenWidth(context) * 0.98,
//                     height: ScreenSize.screenHeight(context) * 0.8,
//                     child: FutureBuilder(
//                       builder: (context, snapshot) {
//                         if (snapshot.hasData) {
//                           return GridView.builder(
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     childAspectRatio: 5 / 3,
//                     // mainAxisSpacing: 5,
//                       ),
//                       itemCount: pokemon!.evolutions!.length,
//                       itemBuilder: (context, index) {
//                     return PokemonCard(
//                         pokemonID: pokemon!.evolutions![index]);
//                       },
//                     ),
//                         }
//                         return CircularProgressIndicator();
//                       },
//                     ))
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
