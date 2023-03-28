import 'dart:convert';

import 'package:moaz_app/core/resourc.dart';

import '../model/store.dart';
import '../model/userapi.dart';
import 'home_repository.dart';
import 'package:http/http.dart' as http;

class HomeRepositoryimpl extends HomeRepository {
  @override
  Future<Resource<Store>> getProduct() async {
    var respons = await http.get(Uri.parse('https://dummyjson.com/products'));

    if (respons.statusCode == 200) {
      var json = jsonDecode(respons.body);
      var store = Store.fromJson(json);
      return Success<Store>(date: store);
    }
    return Error(message: 'error');
  }

  @override
  Future<Resource<UserApi>> getUser() async {
    print('00000000000000000000000');
    var respons = await http.get(Uri.parse('http://localhost:8888/example'));

    if (respons.statusCode == 200) {
      var json = jsonDecode(respons.body);
      var userApi = UserApi.fromJson(json);
      print(userApi.key!.length.toString());

      return Success<UserApi>(date: userApi);
    }
    return Error(message: 'error');
  }
}
