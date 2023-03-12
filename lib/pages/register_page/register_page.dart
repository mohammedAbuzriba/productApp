// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moaz_app/pages/register_page/cubit/register_cubit.dart';

import '../../constants.dart';
import '../../date/model/user.dart';
import '../../route/app_rpute.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});
  static String id = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late RegisterCubit bloc;
  @override
  void initState() {
    bloc = RegisterCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Register Page'),
        ),
        backgroundColor: kPrimaryColor,
        body: BlocProvider(
          create: (context) => bloc,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: BlocListener<RegisterCubit, RegisterState>(
              listener: (context, state) {
                if (state.status == Status.loading) {}
                if (state.status == Status.success) {
                  bloc.init();
                  Navigator.popAndPushNamed(context, AppRoute.homePage,
                      arguments: User(
                          fName: state.fName.toString(),
                          lName: state.lName.toString(),
                          phonNumber: state.phonNumber.toString(),
                          userName: state.userName.toString(),
                          passWord: state.passWord.toString()));
                }
              },
              child: BlocBuilder<RegisterCubit, RegisterState>(
                builder: (context, state) {
                  if (state.status == Status.loading) {
                    return Center(child: RefreshProgressIndicator());
                  }
                  return ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'My App',
                            style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                                fontFamily: 'pacifico'),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            'REGISTER',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                          hitnText: 'first name',
                          onChanged: (value) {
                            bloc.onFirstNameChange(value);
                          },
                          prefixIcon: Icon(Icons.person)),
                      const SizedBox(height: 10),
                      CustomTextField(
                          hitnText: 'last name',
                          onChanged: (value) {
                            bloc.onLastNameChange(value);
                          },
                          prefixIcon: Icon(Icons.person)),
                      const SizedBox(height: 10),
                      CustomTextField(
                          hitnText: 'phon number',
                          onChanged: (value) {
                            bloc.onPhonNumberChange(value);
                          },
                          prefixIcon: Icon(Icons.phone)),
                      const SizedBox(height: 10),
                      CustomTextField(
                          hitnText: 'Username',
                          onChanged: (value) {
                            bloc.onUserNameChange(value);
                          },
                          prefixIcon: Icon(Icons.person_3_sharp)),
                      const SizedBox(height: 10),
                      CustomTextField(
                          hitnText: 'Password',
                          onChanged: (value) {
                            bloc.onPassWordChange(value);
                          },
                          prefixIcon: Icon(Icons.lock)),
                      const SizedBox(height: 20),
                      CustomButton(
                        textButton: 'Register',
                        onTap: () {
                          bloc.register();
                        },
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'already have an account ?',
                            style: TextStyle(color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              '   Login',
                              style: TextStyle(color: Color(0xffc7ede6)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ));
  }
}
