import 'package:flutter/material.dart';
import 'package:pokedex/Utils/utils.dart';

class Category {
  final String? categoryName;
  final String? categoryIcon;
  final Color? categoryColor;

  Category({
    this.categoryName,
    this.categoryIcon,
    this.categoryColor,
  });
}

List<Category> listOfCategory = [
  Category(categoryName: "Pokemon", categoryColor: AppColors.categoryRed),
  Category(categoryName: "Moves", categoryColor: AppColors.categorYellow),
  Category(categoryName: "Evolution", categoryColor: AppColors.categoryGreen),
  Category(categoryName: "Category", categoryColor: AppColors.categoryBlue),
];
