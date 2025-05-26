import 'package:babysteps/auth/forgot_password_page.dart';
import 'package:babysteps/components/enumTypes/social_type.dart';
import 'package:flutter/material.dart';
import 'signup_page.dart';
import 'package:babysteps/core/theme.dart';
import 'package:babysteps/components/social_button.dart';
import 'package:babysteps/components/primary_button.dart';
import 'package:babysteps/components/custom_input_field.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/img/babystepsLogo.png', height: 150),

                const SizedBox(height: 20),
                const Text(
                  'Por favor, entre em sua conta',
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 18,
                    color: Color(0xFF7B7B7B),
                  ),
                ),

                const SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SocialButton(
                      type: SocialType.google,
                      onPressed: () {
                        //Login com google
                      },
                    ),
                    SocialButton(
                      type: SocialType.facebook,
                      onPressed: () {
                        //login com facebook
                      },
                    ),
                    SocialButton(
                      type: SocialType.apple,
                      onPressed: () {
                        //Login apple id
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                Row(
                  children: const [
                    Expanded(
                      child: Divider(color: Color(0xFF7B7B7B), indent: 60),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'or',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF7B7B7B),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(color: Color(0xFF7B7B7B), endIndent: 60),
                    ),
                  ],
                ),

                const SizedBox(height: 30),
                CustomInputField(
                  icon: Icons.person,
                  hintText: 'Entre com seu e-mail',
                ),

                const SizedBox(height: 14),
                CustomInputField(
                  icon: Icons.lock,
                  hintText: 'Entre com sua senha',
                  obscureText: true,
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotPasswordPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Esqueci minha senha',
                      style: TextStyle(
                        fontSize: 10.47,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.secondaryColor,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                PrimaryButton(text: 'Login', onPressed: () {}),

                const SizedBox(height: 2),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: 'Não tenho conta?',
                      children: [
                        TextSpan(
                          text: ' Criar conta',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.textColor,
                          ),
                        ),
                      ],
                    ),
                    style: TextStyle(fontSize: 10.47, color: Color(0xFF7B7B7B)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
