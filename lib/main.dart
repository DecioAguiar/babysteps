import 'package:babysteps/app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final prefs = await SharedPreferences.getInstance();
  final bool hasSeenWelcome = prefs.getBool('hasSeenWelcome') ?? false;

  runApp(BabySteps(hasSeenWelcome: hasSeenWelcome));
}
