import 'package:flutter/material.dart';
import 'package:pokedex/Utils/utils.dart';

class MyChips extends StatelessWidget {
  final String? name;
  const MyChips({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(
            color: getTypeColor(name!),
            width: 1.5,
          ),
          color: getTypeColor(name!).withOpacity(0.01),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Image(image: AssetImage(getTypeIcon(name!)) ,height: Sizes.SIZE_24),
          SpaceW8(),
          Text(name!),
        ],
      ),
    );
  }
}
