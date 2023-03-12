import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moaz_app/route/app_rpute.dart';
import 'package:moaz_app/widgets/custom_button.dart';
import 'package:moaz_app/widgets/custom_text.dart';
import 'package:moaz_app/widgets/product_list.dart';

import '../../constants.dart';
import '../../date/model/user.dart';
import '../../widgets/number.dart';
import 'cubit/home_cubit.dart';
import 'package:bloc/bloc.dart';

class HomePage extends StatefulWidget {
  final User? user;
  HomePage({super.key, this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeCubit bloc;
  @override
  void initState() {
    bloc = HomeCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoute.profilePage,
                        arguments: widget.user);
                  },
                  icon: Icon(Icons.person_3_sharp),
                ),
                Text(
                  widget.user == null
                      ? 'No Auth User'
                      : widget.user!.userName.toString(),
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context,
                        AppRoute.loginPage, (Route<dynamic> route) => false);
                  },
                  icon: Icon(Icons.logout),
                ),
              ],
            )
          ],
          title: Text('Home Page'),
        ),
        backgroundColor: kPrimaryColor,
        body: BlocProvider(
          create: (context) => bloc,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'My Home Page',
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontFamily: 'pacifico'),
                      ),
                    ],
                  ),
                  // Number(),
                  // Number2(),
                  // Number3(),
                  // ButtonOne(),
                  // ButtonTwo(),
                  // ButtonThree(),
                  // ButtonReset()
                  ButtonGetDataFromApi(),

                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ListProduct(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
