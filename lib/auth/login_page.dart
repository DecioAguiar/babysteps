import 'package:babysteps/home/home_page.dart';
import 'package:flutter/material.dart';
import 'auth_controller.dart';
import 'signup_page.dart';

class LoginScreen extends StatelessWidget {
  final AuthController authController = AuthController();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bem vindo ao Babysteps")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: "Usuário"),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Senha"),
              obscureText: true,
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                bool success = authController.login(
                  usernameController.text,
                  passwordController.text,
                );

                if (success) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Login incorreto. Tente novamente!'),
                    ),
                  );
                }
              },
              child: Text('Entrar'),
            ),

            Text('Ainda não tem uma conta? Cadastre-se!'),
            // TextButton(
            //   onPressed: () {
            //     Navigator.pushReplacement(
            //       MaterialPageRoute(builder: (context) => SignUpScreen()),
            //     );
            //   },
            //   child: ,
            // ),
          ],
        ),
      ),
    );
  }
}
