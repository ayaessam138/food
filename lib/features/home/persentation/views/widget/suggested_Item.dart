import 'package:flutter/material.dart';
import 'package:food/core/colors.dart';
import 'package:food/features/home/data/models/food_Model.dart';

class SuggestedItem extends StatelessWidget {
  const SuggestedItem({super.key, required this.foodDrinkModel});
  final FoodDrinkModel foodDrinkModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: AppColors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.2, 0.8), //(x,y)
              blurRadius: 1.0,
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.error),
              foodDrinkModel.imagePath,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              foodDrinkModel.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              '${foodDrinkModel.price}' + '  EGP',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
