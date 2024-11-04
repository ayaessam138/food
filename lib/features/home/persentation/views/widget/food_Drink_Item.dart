import 'package:flutter/material.dart';
import 'package:food/core/colors.dart';
import 'package:food/features/home/data/models/food_Model.dart';

class FoodDrinkItem extends StatelessWidget {
  const FoodDrinkItem({
    super.key,
    required this.foodDrinkModel,
    required this.onTap,
  });
  final FoodDrinkModel foodDrinkModel;
  final void Function() onTap;

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Stack(children: [
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        topLeft: Radius.circular(12))),
                child: Center(
                  child: Image.network(
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.error),
                    foodDrinkModel.imagePath, fit: BoxFit.fill,
                    // height: 200,
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.5), //(x,y)
                          blurRadius: 1.0,
                        ),
                      ],
                      color: foodDrinkModel.itemCounter == 0
                          ? AppColors.white
                          : AppColors.primary,
                      borderRadius: BorderRadius.circular(12)),
                  child: GestureDetector(
                      onTap: onTap,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.add_shopping_cart_outlined,
                          color: foodDrinkModel.itemCounter == 0
                              ? AppColors.primary
                              : AppColors.white,
                        ),
                      )),
                ),
              )
            ]),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        foodDrinkModel.name,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        foodDrinkModel.description,
                        style: TextStyle(color: Colors.grey.shade300),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${foodDrinkModel.price}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
