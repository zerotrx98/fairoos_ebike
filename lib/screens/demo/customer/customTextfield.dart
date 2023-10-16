import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool obscureText;
  final dynamic prefixIcon;
  final bool filled;
  final Color fillColor;
  final String hintText;
  final BorderRadius borderRadius;

  const CustomTextField({
    required this.labelText,
    required this.controller,
    this.obscureText = false,
    this.prefixIcon,
    required this.filled,
    required this.fillColor,
    required this.hintText,
    required this.borderRadius,

  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: fillColor,
        border: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(color: Colors.black12)
        ),
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}