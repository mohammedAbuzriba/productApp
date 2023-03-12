import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moaz_app/core/resourc.dart';

import '../date/model/store.dart';
import '../pages/home_page/cubit/home_cubit.dart';
import 'product_item.dart';

class ListProduct extends StatelessWidget {
  ListProduct({super.key});
  Store? store;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.status == Status.loading) {
          return RefreshProgressIndicator();
        }

        if (state.resorce is Success<Store>) {
          store = (state.resorce as Success<Store>).date;
          return Expanded(
            child: ListView.builder(
              itemCount: store!.products!.length,
              itemBuilder: (context, index) {
                return ProductItem(
                  products: store!.products![index],
                );
              },
            ),
          );
        }

        return CircularProgressIndicator();
      },
    );
  }
}
