import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/colors.dart';
import 'package:meta/meta.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  int currentindex = 0;

  List<BottomNavigationBarItem> ITEMS = [
    BottomNavigationBarItem(
        label: 'Home', icon: Icon(Icons.home, color: AppColors.primary)),
    BottomNavigationBarItem(
      label: 'Cart',
      icon: Icon(Icons.add_card_sharp, color: AppColors.primary),
    ),
  ];

  List<String> apppartitle = [
    'Home',
    'Cart',
  ];
  void pagenavgation(int index) {
    currentindex = index;
    emit(LayoutInitial());
  }
}
