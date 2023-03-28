import 'package:flutter/material.dart';

import '../route/app_rpute.dart';

class App extends StatefulWidget {
  const App({super.key});
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day Two',
      initialRoute: AppRoute.loginPage,
      onGenerateRoute: AppRoute.ongenratedRoute,
    );
  }
}
