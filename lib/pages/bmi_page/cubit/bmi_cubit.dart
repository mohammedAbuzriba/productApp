import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit() : super(BmiInitial());
}
