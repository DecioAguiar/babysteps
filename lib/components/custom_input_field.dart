import 'package:flutter/material.dart';
import 'package:babysteps/core/theme.dart';

class CustomInputField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const CustomInputField({
    super.key,
    required this.icon,
    required this.hintText,
    this.obscureText = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppTheme.inputFieldColor,
        prefixIcon: Icon(icon, color: AppTheme.secondaryColor),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 13, color: AppTheme.hintTextColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        //erro border para que o validator funcione visualmente
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Colors.red, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          // Define a borda quando o campo está habilitado
          borderRadius: BorderRadius.circular(50),
          borderSide:
              BorderSide
                  .none, // Ou BorderSide(color: AppTheme.borderColor, width: 1.0) se quiser uma borda
        ),
        focusedBorder: OutlineInputBorder(
          // Define a borda quando o campo está focado
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 255, 61, 194),
          ),
        ),
      ),
    );
  }
}
