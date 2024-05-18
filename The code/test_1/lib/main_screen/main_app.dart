import 'package:flutter/material.dart';
import 'package:test_1/main_screen/LoginPage.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:test_1/main_screen/main_menu.dart';
import 'package:test_1/main_screen/signup.dart';
import 'audio_manager.dart';

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final AudioManager _audioManager = AudioManager();

  @override
  void initState() {
    super.initState();
    _audioManager.init().then((_) {
      _audioManager.play();
    });
  }

  @override
  void dispose() {
    _audioManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
