import 'package:flutter/material.dart';
import 'package:test_1/main_screen/loginPage.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:test_1/main_screen/main_menu.dart';
import 'package:test_1/main_screen/signup.dart';
import 'package:provider/provider.dart';
import 'audio_manager.dart';

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with WidgetsBindingObserver {
  late AudioManager _audioManager;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _audioManager = Provider.of<AudioManager>(context, listen: false);
    _audioManager.init().then((_) {
      _audioManager.play();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _audioManager.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _audioManager.pause();
    } else if (state == AppLifecycleState.resumed) {
      _audioManager.play();
    }
  } // to handle the audio when the app is paused or resumed.

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
        " MainMenu ": (context) => MainMenu(),
      },
    );
  }
}