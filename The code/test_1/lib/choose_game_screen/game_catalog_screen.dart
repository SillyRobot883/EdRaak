import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/main_screen/main_menu.dart';
import '../game1/the_Game.dart';
import 'package:test_1/choose_game_screen/choose_game_button.dart';
import 'package:test_1/choose_game_screen/game_button1.dart';
import 'package:test_1/game2/lib/quiz.dart';

class GameCatalog extends StatelessWidget {
  final List<ChooseGameButton> games = [
    ChooseGameButton(
      name: 'اختبر نفسك',
      gameWidget: Quiz(),
      color: Color.fromARGB(255, 134, 255, 138),
      imagePath: 'lib/assets/image/image1.png',
    ),
    ChooseGameButton(
      name: 'عد و اللعب',
      gameWidget: The_game(),
      color: Color.fromARGB(255, 134, 255, 138),
      imagePath: 'lib/assets/image/App1Logo.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 23, 188, 62),
                Color.fromARGB(255, 127, 214, 46)
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...games.map(
                  (chooseGameButton) =>
                      GameButton1(chooseGameButton: chooseGameButton),
                ),
                SizedBox(height: 20),
                OutlinedButton(
                  onPressed: () {
                    // Main Menu button pressed, navigate to the main menu
                    Get.offAll(() => MainMenu(),
                        transition: Transition.fade,
                        duration: Duration(milliseconds: 250));
                  },
                  child: Text(
                    'الصفحة الرئيسية',
                    style: TextStyle(
                      color: Color.fromARGB(255, 134, 255, 138),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: Color.fromARGB(255, 91, 213, 95),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
