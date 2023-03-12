import 'dart:convert';

import 'package:moaz_app/core/resourc.dart';

import '../model/store.dart';
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
}
