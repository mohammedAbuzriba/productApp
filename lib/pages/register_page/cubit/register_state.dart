// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_cubit.dart';

enum Status { init, loading, success, error }

class RegisterState extends Equatable {
  final String? fName;
  final String? lName;
  final String? phonNumber;
  final String? userName;
  final String? passWord;
  final Status? status;

  const RegisterState(
      {this.fName,
      this.lName,
      this.phonNumber,
      this.userName,
      this.passWord,
      this.status = Status.init});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [fName, lName, phonNumber, userName, passWord, status];

  RegisterState copyWith({
    String? fName,
    String? lName,
    String? phonNumber,
    String? userName,
    String? passWord,
    Status? status,
  }) {
    return RegisterState(
      fName: fName ?? this.fName,
      lName: lName ?? this.lName,
      phonNumber: phonNumber ?? this.phonNumber,
      userName: userName ?? this.userName,
      passWord: passWord ?? this.passWord,
      status: status ?? this.status,
    );
  }
}
