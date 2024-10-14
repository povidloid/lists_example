import 'package:flutter/material.dart';
import 'package:lists_example/screens/FirstPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}

class UserInfo{
  String? login;
  String? password;

  @override
  String toString() {
    return 'Login: ${login}, Password: ${password}';
  }
}