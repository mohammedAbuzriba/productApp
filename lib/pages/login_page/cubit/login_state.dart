// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_cubit.dart';

enum Status { init, loading, success, error }

class LoginState extends Equatable {
  final String? userName;
  final String? passWord;
  final Status? status;

  LoginState({this.userName, this.passWord, this.status = Status.init});

  @override
  // TODO: implement props
  List<Object?> get props => [userName, passWord, status];

  LoginState copyWith({
    String? userName,
    String? passWord,
    Status? status,
  }) {
    return LoginState(
      userName: userName ?? this.userName,
      passWord: passWord ?? this.passWord,
      status: status ?? this.status,
    );
  }
}
