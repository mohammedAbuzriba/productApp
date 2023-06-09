import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moaz_app/core/resourc.dart';

import '../date/model/store.dart';
import '../date/model/userapi.dart';
import '../pages/home_page/cubit/home_cubit.dart';
import 'product_item.dart';

class ListProduct extends StatelessWidget {
  ListProduct({super.key});
  UserApi? userApi;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.status == Status.loading) {
          print('---------5------------');

          return RefreshProgressIndicator();
        }

        if (state.resorce is Success<UserApi>) {
          print(state.status.toString());
          userApi = (state.resorce as Success<UserApi>).date;
          return Expanded(
            child: ListView.builder(
              itemCount: userApi!.key!.length,
              itemBuilder: (context, index) {
                return ProductItem(
                  userApi: userApi!.key![index],
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
