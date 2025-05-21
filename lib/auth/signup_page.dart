// import 'package:flutter/material.dart';
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
