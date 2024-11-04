part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class Total extends HomeState {}

class IncCounter extends HomeState {}

class MinCounter extends HomeState {}

class GetItemsLoading extends HomeState {}

class GetItemsSucess extends HomeState {
  final List<FoodDrinkModel> foodDrinkList;

  GetItemsSucess({required this.foodDrinkList});
}

class GetItemsFail extends HomeState {
  final String errorMessage;

  GetItemsFail({required this.errorMessage});
}

class AddOrderLoading extends HomeState {}

class AddOrderSucess extends HomeState {}

class AddOrderFail extends HomeState {}

class AddCustomerOrderLoading extends HomeState {}

class AddCustomerOrderSucess extends HomeState {}

class AddCustomerOrderFail extends HomeState {}

class AddItem extends HomeState {}

class RemoveItem extends HomeState {}
