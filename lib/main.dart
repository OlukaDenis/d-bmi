import 'package:flutter/material.dart';
import 'package:weather_focus/screens/bmi_screen.dart';
import 'package:weather_focus/screens/intro_screen.dart';
import 'package:weather_focus/screens/registration_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const IntroScreen(),
        '/bmi': (context) => const BmiScreen(),
        '/register': (context) => const RegistrationScreen()
      }
    );
  }
}