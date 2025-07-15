import 'package:babysteps/components/primary_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recuperação de Senha')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Informe seu e-mail para recuperar a senha'),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              text: 'Enviar',
              onPressed: () {
                //Implementação de recuperação de senha
              },
            ),
          ],
        ),
      ),
    );
  }
}
