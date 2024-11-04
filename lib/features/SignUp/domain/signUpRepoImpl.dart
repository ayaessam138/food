

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food/core/Failure.dart';
import 'package:food/core/increpted_Shared_perfence.dart';
import 'package:food/features/SignUp/data/Model/authModel.dart';
import 'package:food/features/SignUp/data/repo/signUpRepo.dart';

class SignInRepoImpl implements SignUpRepo {
  @override
  Future<Either<Failure, String>> signIn({required AuthModel signUp}) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: signUp.email,
        password: signUp.password,
      );
      SharedPreferenceValueEncrypted.saveUid(userCredential.user?.uid ?? '');
      CollectionReference transaction =
          FirebaseFirestore.instance.collection('Users');
      transaction
          .add({'email': signUp.email, 'uid': userCredential.user?.uid ?? ''});
      return right(userCredential.user?.uid ?? '');
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure.fromFirebase(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
