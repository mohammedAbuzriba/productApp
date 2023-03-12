import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  onUserNameChange(String value) {
    emit(state.copyWith(userName: value));
  }

  onPassWordChange(String value) {
    emit(state.copyWith(passWord: value));
  }

  void login({String? username, String? password}) async {
    emit(state.copyWith(status: Status.loading));
    await Future.delayed(Duration(seconds: 2));
    if (username == 'moha' && password == '1123') {
      emit(state.copyWith(status: Status.success));
    } else {
      emit(state.copyWith(status: Status.error));
    }
  }

  void init() async {
    emit(state.copyWith(status: Status.init));
  }
}
