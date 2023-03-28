import 'package:moaz_app/core/resourc.dart';

import '../model/store.dart';
import '../model/userapi.dart';

abstract class HomeRepository {
  Future<Resource<Store>> getProduct();
  Future<Resource<UserApi>> getUser();
}
