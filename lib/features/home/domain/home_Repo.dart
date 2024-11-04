import 'package:dartz/dartz.dart';
import 'package:food/features/home/data/models/food_Model.dart';

import '../../../core/Failure.dart';

abstract class HomeRepo {
  // that fuction i used to add data to my database
  // Future<void> addItem({required FoodDrinkModel foodDrinkModel});
  Future<void> addCustomerOrder(
      {required List<FoodDrinkModel> foodDrinkList,
      required num total,
      required String uid});
  Future<Either<Failure, List<FoodDrinkModel>>> getItems();
}
