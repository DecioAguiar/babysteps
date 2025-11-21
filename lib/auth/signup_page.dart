import 'package:babysteps/auth/baby_info_setup_page.dart';
import 'package:babysteps/components/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:babysteps/components/custom_input_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      // Mock sign-up logic
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BabyInfoSetupPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Conta'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(28.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/img/babystepsLogo.png', height: 120),
                const SizedBox(height: 20),
                const Text(
                  'Crie sua conta para começar',
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
                const SizedBox(height: 30),
                CustomInputField(
                  controller: _emailController,
                  icon: Icons.email,
                  hintText: 'Email',
                  validator: (value) {
                    if (value == null || value.isEmpty || !value.contains('@')) {
                      return 'Por favor, insira um email válido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomInputField(
                  controller: _passwordController,
                  icon: Icons.lock,
                  hintText: 'Senha',
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 6) {
                      return 'A senha deve ter pelo menos 6 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomInputField(
                  controller: _confirmPasswordController,
                  icon: Icons.lock,
                  hintText: 'Confirmar Senha',
                  obscureText: true,
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'As senhas não coincidem';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                PrimaryButton(
                  text: 'Criar Conta',
                  onPressed: _signUp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
