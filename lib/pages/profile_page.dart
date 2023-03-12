import 'package:flutter/material.dart';

import '../constants.dart';
import '../date/model/user.dart';
import '../route/app_rpute.dart';
import '../widgets/custom_text.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key, this.user});
  final User? user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, AppRoute.loginPage,
                    (Route<dynamic> route) => false);
              },
              icon: Icon(Icons.logout),
            ),
          ],
          title: Text('Profile Page'),
        ),
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Center(
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'My Profile ',
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontFamily: 'pacifico'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CustomText(
                      text: 'My profile',
                      style: TextStyle(fontSize: 32, color: Colors.yellow),
                    ),
                  ],
                ),
                Center(
                  child: Table(
                    textDirection: TextDirection.ltr,
                    border: TableBorder.all(
                        width: 5.0,
                        color: Colors.cyanAccent,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    children: [
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText(
                            text: "first name",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText(
                            text: user == null
                                ? 'No Auth User'
                                : user!.fName.toString(),
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText(
                            text: "last name",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText(
                            text: user == null
                                ? 'No Auth User'
                                : user!.lName.toString(),
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        CustomText(
                          text: "phone Number",
                        ),
                        CustomText(
                          text: user == null
                              ? 'No Auth User'
                              : user!.phonNumber.toString(),
                        ),
                      ]),
                      TableRow(children: [
                        CustomText(
                          text: "user name",
                        ),
                        CustomText(
                            text: user == null
                                ? 'No Auth User'
                                : user!.userName.toString()),
                      ]),
                      TableRow(children: [
                        CustomText(
                          text: "password",
                        ),
                        CustomText(
                          text: user == null
                              ? 'No Auth User'
                              : user!.passWord.toString(),
                        ),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
    ;
  }
}
