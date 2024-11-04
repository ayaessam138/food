import 'package:bloc/bloc.dart';
import 'package:food/features/Login/domain/loginRepo.dart';
import 'package:food/features/SignUp/data/Model/authModel.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final LoginRepo loginRepo;
  Future<void> login({required AuthModel signUp}) async {
    print('loginCubit...');
    emit(LoginLoading());
    var result = await loginRepo.login(login: signUp);
    result.fold((l) {

      print(l.errMessage);
      emit(LoginFail(erorrMessage: l.errMessage));
    }, (r) => emit(LoginSucess()));
  }

  bool isPasswordSeen = true;
  showPassWord() {
    isPasswordSeen = !isPasswordSeen;

    emit(ShowPassword());
  }
}
