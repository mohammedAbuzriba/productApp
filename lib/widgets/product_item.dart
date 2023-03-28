import 'package:flutter/material.dart';

import '../date/model/product.dart';
import '../date/model/userapi.dart' as user;

class ProductItem extends StatelessWidget {
  //Products products;
  user.Key userApi;
  ProductItem({super.key, required this.userApi});

  @override
  Widget build(BuildContext context) {
    print('//////////////////////////');
    print(userApi.toString());

    return SizedBox(
      height: 100,
      child: Card(
        child: Text(userApi.username.toString()),
      ),
    );
  }
}
