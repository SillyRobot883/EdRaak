import 'package:flutter/material.dart';
import 'ImageMatchingGameScreen.dart'; // Ensure the correct import

void main() {
  runApp(The_game());
}

class The_game extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: ImageMatchingGameScreen(),
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
      ),
    );
  }
}
