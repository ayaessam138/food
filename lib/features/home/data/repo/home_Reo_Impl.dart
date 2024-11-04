import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:food/core/Failure.dart';
import 'package:food/features/home/data/models/food_Model.dart';
import 'package:food/features/home/domain/home_Repo.dart';

class HomeReoImpl implements HomeRepo {
  List<FoodDrinkModel> foodDrinkList = [];

  @override
  Future<Either<Failure, List<FoodDrinkModel>>> getItems() async {
    try {
      var ref = await FirebaseFirestore.instance.collection('Items').get();
      if (ref.docs.isNotEmpty) {
        for (var doc in ref.docs) {
          FoodDrinkModel transactionModel = FoodDrinkModel.fromJson(doc.data());
          foodDrinkList.add(transactionModel);
        }
        return right(foodDrinkList);
      } else {
        return Left(
            ServerFailure('Failed to Load items, please Try again Later'));
      }
    } on FirebaseException catch (e) {
      print('FirebaseException: ${e.toString()}');
      return left(ServerFailure('Firebase error: ${e.message}'));
    } catch (e) {
      print('General Exception: ${e.toString()}');
      return left(ServerFailure(e.toString()));
    }
  }


  @override
  Future<void> addCustomerOrder(
      {required List<FoodDrinkModel> foodDrinkList,
      required num total,
      required String uid}) async {
    CollectionReference transaction =
        await FirebaseFirestore.instance.collection('orders');
    List<Map<String, dynamic>> itemsMap =
        foodDrinkList.map((item) => item.toJson()).toList();

    transaction.add({'items': itemsMap, 'total': total,'uid':uid});
  }

//that fuction i used to add data to my database
//   @override
//   Future<void> addItem({required FoodDrinkModel foodDrinkModel}) async {
//     CollectionReference transaction =
//         FirebaseFirestore.instance.collection('Items');
//
//     return transaction
//         .add(foodDrinkModel.toJson())
//         .then((value) => print("transaction Added"))
//         .catchError((error) => print("Failed to add transaction: $error"));
//   }
}
