import 'package:flutter/material.dart';
import 'home/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

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
      home: const HomePage(),
    );
  }
}
