import 'package:flutter/material.dart';
import 'package:moaz_app/date/model/user.dart';
import 'package:moaz_app/pages/home_page/home_page.dart';
import 'package:moaz_app/pages/login_page/login_page.dart';
import 'package:moaz_app/pages/profile_page.dart';
import 'package:moaz_app/pages/register_page/register_page.dart';

class AppRoute {
  static const String homePage = '/';
  static const String loginPage = 'loginPage';
  static const String registerPage = 'registerPage';
  static const String profilePage = 'profilePage';
  static Route<dynamic> ongenratedRoute(RouteSettings routeSettings) {
    var user = routeSettings.arguments as User?;
    switch (routeSettings.name) {
      case loginPage:
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );
      case homePage:
        return MaterialPageRoute(
          builder: (context) => HomePage(user: user),
        );
      case registerPage:
        return MaterialPageRoute(
          builder: (context) => RegisterPage(),
        );
      case profilePage:
        return MaterialPageRoute(
          builder: (context) => ProfilePage(user: user),
        );
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Text('No Route Found !!!')],
                  ),
                ));
    }
  }
}
