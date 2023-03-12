import 'package:flutter/material.dart';

import '../route/app_rpute.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.textButton, this.onTap});
  String? textButton;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        height: 60,
        child: Center(
          child: Text(textButton ?? 'text'),
        ),
      ),
    );
  }
}
