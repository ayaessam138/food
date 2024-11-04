part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginSucess extends LoginState {}
class LoginLoading extends LoginState {}
class LoginFail extends LoginState {
  final String erorrMessage;

  LoginFail({required this.erorrMessage});
}
class ShowPassword extends LoginState {}