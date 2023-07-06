// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:pokedex/Model/models.dart';
import 'package:pokedex/Utils/utils.dart';

class CategoryCard extends StatelessWidget {
  final Category? category;
  const CategoryCard({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const SpaceH30(),
            SizedBox(
              width: ScreenSize.screenWidth(context),
              height: ScreenSize.screenWidth(context) * 0.2,
              child: Card(
                color: category!.categoryColor,
                elevation: 10,
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.ELEVATION_12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.white.withOpacity(0.1),
                        AppColors.white.withOpacity(0.5),
                      ],
                      begin: Alignment.centerRight,
                      end: Alignment.topLeft,
                      // tileMode: TileMode.mirror,
                    ),
                  ),
                  child: Text(
                    category!.categoryName!,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: Sizes.TEXT_SIZE_16,
                    ),
                  ),
                ),
              ),
            ),
          
          ],
        ),
        Container(
            alignment: Alignment.topRight,
            child: const Image(
              image: AssetImage(
                "assets/images/pokeball.png",
              ),
              height: Sizes.HEIGHT_70,
            )),
      ],
    );
  }
}
