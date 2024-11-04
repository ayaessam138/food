import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food/features/home/data/models/food_Model.dart';
import 'package:food/features/home/domain/home_Repo.dart';

import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());

  final HomeRepo homeRepo;
  List<FoodDrinkModel> fooDrinkList = [];
  num itemTotal = 0;
  num subtotal = 0;
  num endTotal = 0;
  final ScrollController controller = ScrollController();
  Future<void> getItems() async {
    try {
      print('getItems...');
      emit(GetItemsLoading());

      var result = await homeRepo.getItems();
      result.fold((l) {
        print('getItemsfail...');
        emit(GetItemsFail(errorMessage: l.errMessage));
      }, (r) {
        print('getItemssucess...');
        fooDrinkList = r;

        emit(GetItemsSucess(foodDrinkList: r));
      });
    } on Exception catch (e) {
      emit(GetItemsFail(errorMessage: e.toString()));
      print(e.toString());
    }
  }

  Future<void> addCustomerOrder(
      {required List<FoodDrinkModel> foodDrinkList}) async {
    try {
      print('addCustomerOrder...');
      emit(AddCustomerOrderLoading());

      await homeRepo.addCustomerOrder(
          foodDrinkList: foodDrinkList,
          total: endTotal,
          uid: FirebaseAuth.instance.currentUser?.uid ?? '');
      emit(AddCustomerOrderSucess());
    } on Exception catch (e) {
      emit(AddCustomerOrderFail());
      print(e.toString());
    }
  }

  counterIncFoodDrink({required int id}) {
    var item = fooDrinkList.firstWhere((element) => element.id == id);
    item.itemCounter++;
    calcTotal();
    emit(IncCounter());
  }

  counterDecFoodDrink({required int id}) {
    var item = fooDrinkList.firstWhere((element) => element.id == id);
    if (item.itemCounter > 0) {
      item.itemCounter--;
      calcTotal();
      emit(IncCounter());
    }
  }

  removeFromCart({required int id}) {
    fooDrinkList
        .where(
          (element) => element.id == id,
        )
        .first
        .itemCounter = 0;
    emit(RemoveItem());
  }

  calcTotal() {
    for (var item in fooDrinkList.where(
      (element) => element.itemCounter != 0,
    )) {
      itemTotal += item.price * item.itemCounter;
    }

    subtotal = itemTotal;
    endTotal = itemTotal + 12;
    itemTotal = 0;
  }

  void nextItem() {
    double itemExtent = 100;
    double offset = controller.offset + itemExtent;

    controller.animateTo(
      offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void changeState() {
    emit(RemoveItem());
  }
// that fuction i used to add data to my database
// Future<void> addItem({required FoodDrinkModel food}) async {
//   try {
//     print('addItem...');
//     emit(AddOrderLoading());
//
//     await homeRepo.addItem(foodDrinkModel: food);
//     emit(AddOrderSucess());
//   } on Exception catch (e) {
//     emit(AddOrderFail());
//     print(e.toString());
//   }
// }
}
