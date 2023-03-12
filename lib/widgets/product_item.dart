import 'package:flutter/material.dart';

import '../date/model/product.dart';

class ProductItem extends StatelessWidget {
  Products products;
  ProductItem({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        child: Text(products.brand.toString()),
      ),
    );
  }
}
