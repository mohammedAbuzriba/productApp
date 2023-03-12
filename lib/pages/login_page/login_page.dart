import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moaz_app/date/model/user.dart';
import 'package:moaz_app/pages/login_page/cubit/login_cubit.dart';
import 'package:moaz_app/route/app_rpute.dart';

import '../../constants.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginCubit bloc;

  @override
  void initState() {
    bloc = LoginCubit();
    super.initState();
  }

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
          centerTitle: true,
        ),
        backgroundColor: kPrimaryColor,
        body: BlocProvider(
          create: (context) => bloc,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state.status == Status.loading) {
                  if (formKey.currentState!.validate()) {}
                }
                if (state.status == Status.error) {
                  if (formKey.currentState!.validate()) {}
                  bloc.init();
                }
                if (state.status == Status.success) {
                  //bloc.init();
                  Navigator.popAndPushNamed(context, AppRoute.homePage,
                      arguments: User(
                          userName: state.userName.toString(),
                          passWord: state.passWord.toString()));
                }
              },
              child: BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  if (state.status == Status.loading) {
                    return Center(child: RefreshProgressIndicator());
                  }

                  return Form(
                    key: formKey,
                    child: ListView(
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
                          children: [
                            Text(
                              'LOGIN',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          onChanged: (value) {
                            bloc.onUserNameChange(value);
                          },
                          validator: (value) {
                            if (value!.isEmpty ||
                                state.status == Status.error) {
                              return 'error username';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: Text(
                              'username',
                              style: TextStyle(color: Colors.white),
                            ),
                            hintText: 'Enter your username',
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          onChanged: (value) {
                            bloc.onPassWordChange(value);
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'error password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: Text(
                              'password',
                              style: TextStyle(color: Colors.white),
                            ),
                            hintText: 'Enter your password',
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                bloc.login(
                                    username: state.userName.toString(),
                                    password: state.passWord.toString());
                              }
                            },
                            child: Text('Login')),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'dont\t have an account ?',
                              style: TextStyle(color: Colors.white),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AppRoute.registerPage);
                              },
                              child: Text(
                                '   Register',
                                style: TextStyle(color: Color(0xffc7ede6)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
