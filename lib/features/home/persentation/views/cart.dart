import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/colors.dart';
import 'package:food/core/widght/Button.dart';

import 'package:food/features/home/persentation/controller/home_cubit.dart';
import 'package:food/features/home/persentation/views/widget/home_Tab_Item.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTabItem(title: 'Order Details'),
              const SizedBox(
                height: 12,
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  var cubit = BlocProvider.of<HomeCubit>(context);
                  return Expanded(
                      flex: 3,
                      child: cubit.fooDrinkList
                              .where(
                                (element) => element.itemCounter != 0,
                              )
                              .toList()
                              .isNotEmpty
                          ? ListView.separated(
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 12,
                                );
                              },
                              itemCount: cubit.fooDrinkList
                                  .where(
                                    (element) => element.itemCounter != 0,
                                  )
                                  .length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.network(
                                          errorBuilder: (context, error, stackTrace) =>
                                              const Icon(Icons.error),
                                          height: 200,
                                          width: 200,
                                          cubit.fooDrinkList
                                              .where(
                                                (element) =>
                                                    element.itemCounter != 0,
                                              )
                                              .toList()[index]
                                              .imagePath,

                                          fit: BoxFit.cover,
                                          // height: 200,
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              cubit.fooDrinkList
                                                  .where(
                                                    (element) =>
                                                        element.itemCounter !=
                                                        0,
                                                  )
                                                  .toList()[index]
                                                  .name,
                                              style: const TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            const SizedBox(
                                              width: 12,
                                            ),
                                            Text(
                                              '${cubit.fooDrinkList.where(
                                                    (element) =>
                                                        element.itemCounter !=
                                                        0,
                                                  ).toList()[index].price} EGP',
                                              //   '${foodDrinkModel.price}' + '  EGP',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              width: 12,
                                            ),
                                            Container(
                                                decoration: BoxDecoration(
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Colors.grey,
                                                        offset: Offset(
                                                            0.0, 0.5), //(x,y)
                                                        blurRadius: 1.0,
                                                      ),
                                                    ],
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                child: Row(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        cubit
                                                            .counterIncFoodDrink(
                                                                id: BlocProvider.of<
                                                                            HomeCubit>(
                                                                        context)
                                                                    .fooDrinkList
                                                                    .where(
                                                                      (element) =>
                                                                          element
                                                                              .itemCounter !=
                                                                          0,
                                                                    )
                                                                    .toList()[
                                                                        index]
                                                                    .id);
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 8.0,
                                                                vertical: 4),
                                                        child: Icon(
                                                          Icons.exposure_plus_1,
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                      ),
                                                    ),
                                                    Text('${cubit.fooDrinkList.where(
                                                          (element) =>
                                                              element
                                                                  .itemCounter !=
                                                              0,
                                                        ).toList()[index].itemCounter}'),
                                                    InkWell(
                                                      onTap: () {
                                                        BlocProvider.of<
                                                                    HomeCubit>(
                                                                context)
                                                            .counterDecFoodDrink(
                                                                id: BlocProvider.of<
                                                                            HomeCubit>(
                                                                        context)
                                                                    .fooDrinkList
                                                                    .where(
                                                                      (element) =>
                                                                          element
                                                                              .itemCounter !=
                                                                          0,
                                                                    )
                                                                    .toList()[
                                                                        index]
                                                                    .id);
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 8.0,
                                                                vertical: 4),
                                                        child: Icon(
                                                          Icons
                                                              .exposure_minus_1,
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                          : const Center(
                              child: Text('you Do not Add any Items ,yet')));
                },
              ),
              const SizedBox(
                height: 12,
              ),
              BlocConsumer<HomeCubit, HomeState>(
                listener: (BuildContext context, HomeState state) {
                  if (state is AddCustomerOrderSucess) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        // Auto-close the dialog after 1 second
                        Future.delayed(const Duration(seconds: 2), () {
                          Navigator.of(context).pop();
                        });

                        return AlertDialog(
                          backgroundColor: AppColors.white,
                          title: Text('Order Confirmation',
                              style: TextStyle(color: AppColors.secondary)),
                          content:
                              const Text('Your order has been successfully placed!'),
                        );
                      },
                    ).then((onValue) {
                      for (var item in BlocProvider.of<HomeCubit>(context)
                          .fooDrinkList
                          .where(
                            (element) => element.itemCounter != 0,
                          )) {
                        item.itemCounter = 0;
                        BlocProvider.of<HomeCubit>(context).changeState();
                      }
                    });
                  }
                },
                builder: (context, state) {
                  var cubit = BlocProvider.of<HomeCubit>(context);
                  return cubit.fooDrinkList
                          .where(
                            (element) => element.itemCounter != 0,
                          )
                          .toList()
                          .isNotEmpty
                      ? Expanded(
                          child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24.0, vertical: 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'SubTotal',
                                      style: TextStyle(color: AppColors.white),
                                    ),
                                    Text(
                                      cubit.subtotal.toString(),
                                      style: TextStyle(color: AppColors.white),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Delivery',
                                      style: TextStyle(color: AppColors.white),
                                    ),
                                    Text('12 EGP',
                                        style:
                                            TextStyle(color: AppColors.white))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total',
                                      style: TextStyle(
                                          color: AppColors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                    Text(cubit.endTotal.toString(),
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 24))
                                  ],
                                ),
                                Row(
                                  children: [
                                    state is AddCustomerOrderLoading
                                        ? const Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : Expanded(
                                            child: CustomButton(
                                              onTap: () {

                                                cubit.addCustomerOrder(
                                                    foodDrinkList:
                                                        cubit.fooDrinkList
                                                            .where(
                                                              (element) =>
                                                                  element
                                                                      .itemCounter !=
                                                                  0,
                                                            )
                                                            .toList());
                                              },
                                              backGroundcolor: AppColors.white,
                                              widget: Center(
                                                  child: Text('Place Order',
                                                      style: TextStyle(
                                                          color:
                                                              AppColors.primary,
                                                          fontWeight: FontWeight
                                                              .bold))),
                                            ),
                                          ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ))
                      : const SizedBox.shrink();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
