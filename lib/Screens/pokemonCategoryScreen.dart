import 'package:flutter/material.dart';
import 'package:pokedex/Model/models.dart';
import 'package:pokedex/Utils/utils.dart';
import 'package:pokedex/widgets/widgets.dart';

List<Category> listOfCategory = [
  Category(
      categoryName: AppConstants.bug,
      heroTag: AppConstants.bug,
      categoryColor: getTypeColor(AppConstants.bug),
      categoryIcon: AssetsPath.bug),
  Category(
      categoryName: AppConstants.dark,
      heroTag: AppConstants.dark,
      categoryColor: getTypeColor(AppConstants.dark),
      categoryIcon: AssetsPath.dark),
  Category(
      categoryName: AppConstants.dragon,
      heroTag: AppConstants.dragon,
      categoryColor: getTypeColor(AppConstants.dragon),
      categoryIcon: AssetsPath.dragon),
  Category(
      categoryName: AppConstants.electric,
      heroTag: AppConstants.electric,
      categoryColor: getTypeColor(AppConstants.electric),
      categoryIcon: AssetsPath.electric),
  Category(
      categoryName: AppConstants.fighting,
      heroTag: AppConstants.fighting,
      categoryColor: getTypeColor(AppConstants.fighting),
      categoryIcon: AssetsPath.fighting),
  Category(
      categoryName: AppConstants.fire,
      heroTag: AppConstants.fire,
      categoryColor: getTypeColor(AppConstants.fire),
      categoryIcon: AssetsPath.fire),
  Category(
      categoryName: AppConstants.flying,
      heroTag: AppConstants.flying,
      categoryColor: getTypeColor(AppConstants.flying),
      categoryIcon: AssetsPath.flying),
  Category(
      categoryName: AppConstants.ghost,
      heroTag: AppConstants.ghost,
      categoryColor: getTypeColor(AppConstants.ghost),
      categoryIcon: AssetsPath.ghost),
  Category(
      categoryName: AppConstants.grass,
      heroTag: AppConstants.grass,
      categoryColor: getTypeColor(AppConstants.grass),
      categoryIcon: AssetsPath.grass),
  Category(
      categoryName: AppConstants.ground,
      heroTag: AppConstants.ground,
      categoryColor: getTypeColor(AppConstants.ground),
      categoryIcon: AssetsPath.ground),
  Category(
      categoryName: AppConstants.ice,
      heroTag: AppConstants.ice,
      categoryColor: getTypeColor(AppConstants.ice),
      categoryIcon: AssetsPath.ice),
  Category(
      categoryName: AppConstants.normal,
      heroTag: AppConstants.normal,
      categoryColor: getTypeColor(AppConstants.normal),
      categoryIcon: AssetsPath.normal),
  Category(
      categoryName: AppConstants.poison,
      heroTag: AppConstants.poison,
      categoryColor: getTypeColor(AppConstants.poison),
      categoryIcon: AssetsPath.poison),
  Category(
      categoryName: AppConstants.psychic,
      heroTag: AppConstants.psychic,
      categoryColor: getTypeColor(AppConstants.psychic),
      categoryIcon: AssetsPath.psychic),
  Category(
      categoryName: AppConstants.rock,
      heroTag: AppConstants.rock,
      categoryColor: getTypeColor(AppConstants.rock),
      categoryIcon: AssetsPath.rock),
  Category(
      categoryName: AppConstants.steel,
      heroTag: AppConstants.steel,
      categoryColor: getTypeColor(AppConstants.steel),
      categoryIcon: AssetsPath.steel),
  Category(
      categoryName: AppConstants.water,
      heroTag: AppConstants.water,
      categoryColor: getTypeColor(AppConstants.water),
      categoryIcon: AssetsPath.water),
];

class PokemonCategoryScreen extends StatelessWidget {
  const PokemonCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: listOfCategory.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 6/5),
        itemBuilder: (context, index) {
          return CategoryCard(
            category: listOfCategory[index],
          );
        },
      ),
    );
  }
}
