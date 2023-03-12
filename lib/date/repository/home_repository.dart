import 'package:moaz_app/core/resourc.dart';

import '../model/store.dart';

abstract class HomeRepository {
  Future<Resource<Store>> getProduct();
}
