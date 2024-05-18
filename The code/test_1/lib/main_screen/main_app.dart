import 'package:flutter/material.dart';
import 'package:test_1/main_screen/LoginPage.dart';
import 'package:test_1/main_screen/main_menu.dart';
import 'package:test_1/main_screen/signup.dart';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EdRaak',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainMenu(),
      routes: {
        "signup": (context) => SignUp(),
        "login": (context) => LoginPage(),
        " MainMenu ": (context) => MainMenu()
      },
    );
  }
}
