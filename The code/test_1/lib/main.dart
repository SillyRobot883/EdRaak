import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:test_1/game1/SoundManager.dart';
import 'package:test_1/main_screen/main_app.dart';
import 'main_screen/Settings.dart';
import 'main_screen/audio_manager.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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