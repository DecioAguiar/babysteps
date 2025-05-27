import 'package:flutter/material.dart';
import 'package:babysteps/core/theme.dart';

class CustomInputField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final bool obscureText;

  const CustomInputField({
    super.key,
    required this.icon,
    required this.hintText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppTheme.inputFieldColor,
        prefixIcon: Icon(icon, color: AppTheme.secondaryColor),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 13,color: AppTheme.hintTextColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
