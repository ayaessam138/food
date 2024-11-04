import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/layout_cubit.dart';
import 'package:food/features/home/persentation/views/cart.dart';
import 'package:food/features/home/persentation/views/home_Page.dart';

class AppLayout extends StatelessWidget {
  static String AppLayoutid = 'AppLayout';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          List<Widget> Screens = [
            const HomeScreen(),
            const Cart(),
          ];
          return Scaffold(
              body: Screens[BlocProvider.of<LayoutCubit>(context).currentindex],
              bottomNavigationBar: BottomNavigationBar(
                showSelectedLabels: true,
                selectedLabelStyle: const TextStyle(color: Colors.black),
                currentIndex:
                    BlocProvider.of<LayoutCubit>(context).currentindex,
                items: BlocProvider.of<LayoutCubit>(context).ITEMS,
                onTap: (index) {
                  BlocProvider.of<LayoutCubit>(context).pagenavgation(index);
                },
              ));
        },
      ),
    );
  }
}
