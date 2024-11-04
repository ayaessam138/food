import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/colors.dart';
import 'package:food/features/home/persentation/controller/home_cubit.dart';
import 'package:food/features/home/persentation/views/widget/food_Drink_Item.dart';

class Drink extends StatelessWidget {
  const Drink({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 12,
            ),
            BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
              var cubit = BlocProvider.of<HomeCubit>(context);
              if (state is GetItemsSucess ||
                  state is IncCounter ||
                  state is AddItem ||
                  state is RemoveItem) {
                return Expanded(
                  flex: 3,
                  child: GridView.builder(
                    itemCount: cubit.fooDrinkList
                        .where(
                          (element) => element.categoreyId == 2,
                    )
                        .length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      crossAxisSpacing: 12.0, // Spacing between columns
                      mainAxisSpacing: 12.0, // Spacing between rows
                      childAspectRatio: 0.8, // Aspect ratio of each item
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: FoodDrinkItem(
                          foodDrinkModel: cubit.fooDrinkList
                              .where(
                                (element) => element.categoreyId == 2,
                          )
                              .toList()[index],
                          onTap: () {
                            cubit.fooDrinkList
                                .where(
                                  (element) => element.categoreyId == 2,
                            )
                                .toList()[index]
                                .itemCounter ==
                                0
                                ? cubit.counterIncFoodDrink(
                                id: cubit.fooDrinkList
                                    .where(
                                      (element) => element.categoreyId == 2,
                                )
                                    .toList()[index]
                                    .id)
                                : cubit.removeFromCart(
                                id: cubit.fooDrinkList
                                    .where(
                                      (element) => element.categoreyId == 2,
                                )
                                    .toList()[index]
                                    .id);
                          },
                        ),
                      );
                    },
                  ),
                );
              } else if (state is GetItemsFail) {
                return Center(child: Text(state.errorMessage));
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
          ],
        ));
  }
}