


import 'package:dartz/dartz.dart';
import 'package:food/core/Failure.dart';
import 'package:food/features/SignUp/data/Model/authModel.dart';

abstract class SignUpRepo {
  Future<Either<Failure, String>> signIn({required AuthModel signUp});
}
