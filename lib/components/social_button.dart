import 'package:flutter/material.dart';
import 'package:babysteps/components/enumTypes/social_type.dart';

class SocialButton extends StatelessWidget {
  final SocialType type;
  final VoidCallback onPressed;

  const SocialButton({super.key, required this.type, required this.onPressed});

  @override
  Widget build(BuildContext) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: ClipOval(
          child: IconButton(
            icon: Image.asset(type.iconPath, width: 70, height: 70),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
