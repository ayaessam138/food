import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/colors.dart';
import 'package:food/features/home/persentation/controller/home_cubit.dart';
import 'package:food/features/home/persentation/views/drink.dart';
import 'package:food/features/home/persentation/views/food.dart';
import 'package:food/features/home/persentation/views/widget/home_Tab_Item.dart';
import 'package:food/features/home/persentation/views/widget/suggested_Item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController controller = PageController();
  int index = 0;

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
              Text(
                'Recommended Products ',
                style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 12,
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is GetItemsSucess ||
                      state is IncCounter ||
                      state is AddItem ||
                      state is RemoveItem) {
                    return Expanded(
                      child: Stack(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            // controller:
                            //     BlocProvider.of<HomeCubit>(context).controller,
                            child: Row(
                              children: BlocProvider.of<HomeCubit>(context)
                                  .fooDrinkList
                                  .map((e) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: SuggestedItem(
                                    foodDrinkModel: e,
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (state is GetItemsFail) {
                    return Expanded(
                        child: Center(child: Text(state.errorMessage)));
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HomeTabItem(
                    onTap: () {
                      //invke method to add new item
                      // FoodDrinkModel food = FoodDrinkModel(
                      //     id: 10,
                      //     imagePath:
                      //         'data:image/jpeg;base64,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',
                      //     name: 'OrangeJuice',
                      //     description: 'Fresh Orange Juice',
                      //     price: 100,
                      //     categoreyId: 2);
                      // BlocProvider.of<HomeCubit>(context).addItem(food: food);
                      setState(() {
                        index = 0;
                      });
                      controller.animateToPage(index,
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.linear);
                    },
                    title: 'Food',
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  HomeTabItem(
                    onTap: () {
                      setState(() {
                        index = 1;
                      });
                      controller.animateToPage(index,
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.linear);
                    },
                    title: 'Drink',
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Expanded(
                child: PageView(
                  // },
                  controller: controller,
                  children: const [Food(), Drink()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     _tabController = TabController(length: 2, vsync: this, initialIndex: 1);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //
//       //   backgroundColor: AppColors.primary,
//       //   title: TabBar(
//       //
//       //       indicatorColor: AppColors.primary,
//       //       controller: _tabController,
//       //       labelColor: AppColors.white,
//       //       // unselectedLabelColor: AppColors.primary,
//       //       tabs: const [
//       //         Text(
//       //           'Food',
//       //         ),
//       //         Text(
//       //           'Drink',
//       //         ),
//       //       ]),
//       // ),
//       body: Column(
//         children: [
//           TabBar(
//               // labelPadding: EdgeInsets.zero,
//               indicatorColor: AppColors.white,
//               dividerColor: Colors.white,
//               controller: _tabController,
//               labelColor: AppColors.white,
//               // unselectedLabelColor: AppColors.primary,
//               tabs: [
//                 Container(
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: AppColors.primary,
//                   ),
//                   child: Center(
//                     child: Text(
//                       'Food',
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: 50,
//                   decoration: BoxDecoration(color: AppColors.primary),
//                   child: Center(
//                     child: Text(
//                       'Drink',
//                     ),
//                   ),
//                 ),
//               ]),
//           Expanded(
//             child: TabBarView(controller: _tabController, children:  [
//            Categorey(),
//               Text('data')
//             ]),
//           ),
//         ],
//       ),
//     );
//   }
// }
