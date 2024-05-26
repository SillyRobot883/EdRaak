import 'package:flutter/material.dart';
import 'package:test_1/main_screen/main_app.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MainApp());

}
