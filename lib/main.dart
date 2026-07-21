import 'package:flutter/material.dart';
import 'package:login_signup/login_screens/login_screen1.dart';
import 'package:login_signup/login_screens/login_screen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: LoginScreen1(),
      home: LoginScreen2(),
    );
  }
}

