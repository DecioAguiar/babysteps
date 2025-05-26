import 'package:flutter/material.dart';
import 'package:babysteps/core/theme.dart';
import 'package:babysteps/components/primary_button.dart';
import 'package:babysteps/components/custom_input_field.dart';
import 'package:babysteps/components/social_button.dart';
import 'package:babysteps/components/enumTypes/social_type.dart';

class SignUpPage extends StatelessWidget {
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
                  'Por favor, crie sua conta',
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
                  hintText: 'Digite seu nome',
                ),

                const SizedBox(height: 14),
                CustomInputField(
                  icon: Icons.email,
                  hintText: 'Digite seu e-mail',
                ),

                const SizedBox(height: 14),
                CustomInputField(
                  icon: Icons.lock,
                  hintText: 'Digite sua senha',
                  obscureText: true,
                ),

                const SizedBox(height: 20),
                PrimaryButton(
                  text: 'Criar',
                  onPressed: () {
                    // Lógica para criar conta
                  },
                ),

                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Volta para LoginPage
                  },
                  child: const Text(
                    'Já tenho uma conta',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.secondaryColor,
                    ),
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

// import 'package:babysteps/home/home_page.dart';
// import 'package:babysteps/auth/auth_controller.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController =
//       TextEditingController();

//   void _showMessage(String text, {bool success = false}) {
//     final snackBar = SnackBar(
//       content: Text(text),
//       backgroundColor: success ? Colors.green : Colors.red,
//     );
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }

//   void _register() {
//     String name = nameController.text.trim();
//     String email = emailController.text.trim();
//     String password = passwordController.text;
//     String confirmPassword = confirmPasswordController.text;

//     if (name.isEmpty ||
//         email.isEmpty ||
//         password.isEmpty ||
//         confirmPassword.isEmpty) {
//       _showMessage("Preencha todos os campos");
//     } else if (!email.contains('@')) {
//       _showMessage("Email inválodo. Digite um email válido");
//     } else if (password.length < 6) {
//       _showMessage("A senha deve ter pelo menos 6 caracteres.");
//     } else if (password != confirmPassword) {
//       _showMessage("As senhas não coincidem.");
//     } else {
//       _showMessage("Cadastro realizado com sucesso!", success = true);

//       Future.delayed(Duration(seconds: 1), () {
//         if (!mounted) return;
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const HomePage()),
//         );
//       });
//     }
//   }
// }
