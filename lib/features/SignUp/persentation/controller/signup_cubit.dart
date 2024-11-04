import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/SignUp/data/Model/authModel.dart';
import 'package:food/features/SignUp/data/repo/signUpRepo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.signInRepo) : super(SignupInitial());
  final SignUpRepo signInRepo;

  Future<void> sigIup({required AuthModel signUp}) async {
    print('sigupCubit...');
    emit(SignIupLoading());
    var result = await signInRepo.signIn(signUp: signUp);
    result.fold((l) => emit(SignupFail(errorMessage: l.errMessage)),
        (r) => emit(SignupSucess(uid: r)));
  }

  bool isPasswordSeen = true;
  showPassWord() {
    isPasswordSeen = !isPasswordSeen;

    emit(ShowPassword());
  }
}
