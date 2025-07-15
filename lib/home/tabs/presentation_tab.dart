import 'package:flutter/material.dart';

class PresentationTab extends StatelessWidget {
  const PresentationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // Ao tocar em qualquer lugar da tela:
          // Navigator.push(context, MaterialPageRoute(builder: (_) => NextPage()));
        },
        child: Stack(
          children: [
            SizedBox.expand(
              child: Image.asset('assets/img/Mother.png', fit: BoxFit.cover),
            ),

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withAlpha((0.20 * 255).toInt()),
                    Colors.black.withAlpha((0.65 * 255).toInt()),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  Image.asset('assets/img/LogoWhite.png', height: 130),
                  const Spacer(),
                  const Text(
                    "Olá! Aqui é a assistente virtual de saúde do BabySteps. Ficamos felizes pelo seu cadastro em nosso chat. Agora, vamos ao preenchimento de algumas informações importantes para compreendermos melhor sobre a criança e você enquanto pai/mãe/cuidador.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 13,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'Vamos Começar',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter",
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
