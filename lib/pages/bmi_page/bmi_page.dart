import 'package:flutter/material.dart';

import 'result_page.dart';

class Bmi extends StatefulWidget {
  const Bmi({super.key});

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  @override
  Widget build(BuildContext context) {
    return Result(
      age: 20,
      isMale: true,
      result: 10.555555555,
    );
  }
}
