import 'package:babysteps/education/definicao_dominios_page.dart';
import 'package:babysteps/education/desenvolvimento_com_afeto_page.dart';
import 'package:babysteps/education/tecnicas_estimulacao_page.dart';
import 'package:babysteps/home/tabs/presentation_tab.dart';
import 'package:babysteps/home/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'auth/login_page.dart';
import 'home/home_page.dart';

class BabySteps extends StatelessWidget {
  final bool hasSeenWelcome;
  const BabySteps({super.key, required this.hasSeenWelcome});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BabySteps',
      theme: ThemeData(
        fontFamily: 'Inter',
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFD5CCFF),
        useMaterial3: true,
      ),

      initialRoute: hasSeenWelcome ? '/login_page' : '/welcome_screen',

      routes: {
        '/presentation_tab': (context) => PresentationTab(),
        '/welcome_screen': (context) => WelcomeScreen(),
        '/login_page': (context) => LoginPage(),
        '/home_page': (context) => const HomePage(),
        '/desenvolvimento_com_afeto': (context) => const DesenvolvimentoComAfetoPage(),
        '/definicao_dominios': (context) => const DefinicaoDominiosPage(),
        '/tecnicas_estimulacao': (context) => const TecnicasEstimulacaoPage(),
        // '/signup_page': (context) => SignUpScreen(),
      },
    );
  }
}
