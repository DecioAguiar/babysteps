// widget principal com o MaterialApp, rotas e tema.
import 'package:babysteps/home/tabs/presentation_tab.dart';
import 'package:babysteps/home/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'auth/login_page.dart';
import 'home/home_page.dart';
import 'core/theme.dart';

class BabySteps extends StatelessWidget {
  const BabySteps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BabySteps',
      theme: AppTheme.lightTheme,

      initialRoute: '/welcome_screen',

      routes: {
        '/presentation_tab': (context) => PresentationTab(),
        '/welcome_screen': (context) => WelcomeScreen(),
        '/login_page': (context) => LoginPage(),
        '/home_page': (context) => const HomePage(),
        // '/signup_page': (context) => SignUpScreen(),
      },
    );
  }
}
