
import 'package:dartz/dartz.dart';
import 'package:food/core/Failure.dart';
import 'package:food/features/SignUp/data/Model/authModel.dart';

abstract class LoginRepo {
  Future<Either<Failure,void>> login({required AuthModel login});

}