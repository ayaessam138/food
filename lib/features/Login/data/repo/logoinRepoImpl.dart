import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food/core/Failure.dart';
import 'package:food/features/Login/domain/loginRepo.dart';
import 'package:food/features/SignUp/data/Model/authModel.dart';

class LogoInRepoImpl implements LoginRepo {
  @override
  Future<Either<Failure, void>> login({required AuthModel login}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: login.email, password: login.password);

      return right(null);
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure.fromFirebase(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
