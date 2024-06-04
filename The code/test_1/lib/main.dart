import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:test_1/game1/soundManager.dart';
import 'package:test_1/main_screen/main_app.dart';
import 'main_screen/settings.dart';
import 'main_screen/audio_manager.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  if (kIsWeb) {
    // running on the web!
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBJC8DpfK2H9qziqEt1TVNwtMgeeixcZ0E",
            appId: "1:738177878309:web:db911d332084535d50f2cc",
            messagingSenderId: "738177878309",
            projectId: "edraak1-2fb39"));
  } else {
    // NOT running on the web! You can check for additional platforms here.
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  runApp(
    MultiProvider(
      providers: [
        Provider<AudioManager>(create: (_) => AudioManager()),
        Provider<SoundManager>(create: (_) => SoundManager()),
      ],
      child: MainApp(),
    ),
  );
}
