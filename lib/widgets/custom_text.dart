import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({this.text, this.style});
  String? text;
  TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? 'text',
      style: style ?? const TextStyle(fontSize: 24, color: Colors.white),
    );
  }
}
