part of 'home_cubit.dart';

enum Status { init, loading, success, error }

class HomeState extends Equatable {
  final String? num1;
  final String? num2;
  final String? num3;
  final Status status;
  final Resource<Store>? resorce;

  const HomeState(
      {this.num1,
      this.num2,
      this.num3,
      this.resorce,
      this.status = Status.init});

  HomeState copyWith(
      {String? num1,
      String? num2,
      String? num3,
      Resource<Store>? resorce,
      Status status = Status.init}) {
    return HomeState(
        num1: num1 ?? this.num1,
        num2: num2 ?? this.num2,
        num3: num3 ?? this.num3,
        resorce: resorce ?? this.resorce,
        status: status);
  }

  @override
  List<Object?> get props => [num1, num2, num3, resorce, status];
}

class HomeInitial extends HomeState {}
