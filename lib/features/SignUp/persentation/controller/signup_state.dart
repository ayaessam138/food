part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignIupLoading extends SignupState {}

class SignupFail extends SignupState {
  final String errorMessage;

  SignupFail({required this.errorMessage});
}

class SignupSucess extends SignupState {
  final String uid;

  SignupSucess({required this.uid});
}
class ShowPassword extends SignupState {}