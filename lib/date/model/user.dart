// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String? fName;
  final String? lName;
  final String? phonNumber;
  String userName;
  String passWord;
  User({
    this.fName,
    this.lName,
    this.phonNumber,
    required this.userName,
    required this.passWord,
  });
}
