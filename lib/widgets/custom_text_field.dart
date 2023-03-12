import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {required this.hitnText, required this.onChanged, this.prefixIcon});
  String? hitnText;
  Widget? prefixIcon;
  final Function(dynamic val) onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.white),
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: prefixIcon ?? null,
        label: Text(
          hitnText ?? '',
          style: TextStyle(color: Colors.white),
        ),
        hintText: 'Enter your $hitnText',
        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
