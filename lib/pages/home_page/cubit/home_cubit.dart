import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moaz_app/core/resourc.dart';
import 'package:moaz_app/date/repository/home_repositoryimpl.dart';

import '../../../date/model/store.dart';
import '../../../date/model/userapi.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  HomeRepositoryimpl repositoryimpl = HomeRepositoryimpl();
  void num1onChange(String value) {
    emit(state.copyWith(num1: value));
  }

  void num2onChange(String value) {
    emit(state.copyWith(num2: value));
  }

  void num3onChange(String value) {
    emit(state.copyWith(num3: value));
  }

  getProducts() async {
    emit(state.copyWith(status: Status.loading));
    var result = await repositoryimpl.getUser();
    emit(state.copyWith(resorce: result, status: Status.success));
  }

  getUserApi() async {
    emit(state.copyWith(status: Status.loading));
    print('---------0------------');
    var result = await repositoryimpl.getUser();
    print('---------1------------');
    emit(state.copyWith(resorce: result, status: Status.success));
    print('---------2------------');
  }
}
