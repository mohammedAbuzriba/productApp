import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState());

  onFirstNameChange(String value) {
    emit(state.copyWith(fName: value));
  }

  onLastNameChange(String value) {
    emit(state.copyWith(lName: value));
  }

  onPhonNumberChange(String value) {
    emit(state.copyWith(phonNumber: value));
  }

  onUserNameChange(String value) {
    emit(state.copyWith(userName: value));
  }

  onPassWordChange(String value) {
    emit(state.copyWith(passWord: value));
  }

  void register() async {
    emit(state.copyWith(status: Status.loading));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(status: Status.success));
  }

  void init() async {
    emit(state.copyWith(status: Status.init));
  }
}
