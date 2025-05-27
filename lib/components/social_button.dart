import 'package:flutter/material.dart';
import 'package:babysteps/components/enumTypes/social_type.dart';

class SocialButton extends StatelessWidget {
  final SocialType type;
  final VoidCallback onPressed;

  const SocialButton({super.key, required this.type, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: IconButton(
        icon: Image.asset(type.iconPath, width: 80, height: 80),
        onPressed: onPressed,
      ),
    );
  }
}
