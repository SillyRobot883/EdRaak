import 'dart:math';

import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ResultPage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(The_game());
}

// ...

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

@override

// ...

class ImageMatchingGameScreen extends StatefulWidget {
  @override
  _ImageMatchingGameScreenState createState() =>
      _ImageMatchingGameScreenState();
}

class _ImageMatchingGameScreenState extends State<ImageMatchingGameScreen> {
  List<List<String>> levelsImages = [
    [
      'images/Ball.png',
      'images/Ball.png',
      'images/Ball.png',
      'images/Ball.png',
    ],
    [
      'images/Apple.png',
      'images/Apple.png',
      'images/Apple.png',
      'images/Ball.png',
      'images/Ball.png',
    ],
    ['images/Clocks.png', 'images/Clocks.png', 'images/Apple.png'],

    [
      'images/Egg.png',
      'images/Battery.png', //add an image
      'images/Battery.png',
      'images/Ball.png',
      'images/Tree.png' //add an image
    ],
    // Add more levels as needed
  ];

  List<int> correctAnswers = [4, 3, 2, 1];
  List<String> Questions = [
    "كم عدد الكرات ؟",
    "كم عدد التفاحات ؟",
    "كم عدد الساعات ؟",
    "كم عدد البيضات ؟"
  ];
  int currentLevel = 1;
  int score = 0;

  late ConfettiController _confettiController;

  Color co = Colors.grey;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 3));

    loadingData();
  }

  void loadingData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var color = pref.getString("color");
    setState(() {
      if (color == "amber") {
        co = Colors.amber;
      }
      if (color == "white") {
        co = Colors.white;
      }
      if (color == "blue") {
        co = Colors.blue;
      }
      if (color == "grey") {
        co = Colors.grey;
      }
    });
  }

  void restartGame() {
    setState(() {
      score = 0;
      currentLevel = 1;
    });
  }

  void startNewLevel() {
    setState(() {
      if (currentLevel < levelsImages.length) {
        // If there are more levels, move to the next level
        currentLevel++;
        score++;
        _confettiController.play();
      } else {
        // If the user answered the last question, check if the answer is correct
        if (correctAnswers[levelsImages.length - 1] == 1) {
          // If the answer is correct, increase the score
          score++;
        }

        // Reset the current level to 1 for the next game
        currentLevel = 1;

        // Navigate to the result page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(
              score: score,
              onRetryPressed: restartGame,
            ),
          ),
        );
      }
    });
  }

  void startNewLevel_2() {
    setState(() {
      if (currentLevel < levelsImages.length) {
        // If there are more levels, move to the next level
        currentLevel++;
      } else {
        // If the user answered the last question, check if the answer is correct

        // Reset the current level to 1 for the next game
        currentLevel = 1;

        // Navigate to the result page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(
              score: score,
              onRetryPressed: restartGame,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/BackgroundImage.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 47.0),
              Container(
                height: 40,
                width: 220,
                margin: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    color: Colors.brown[300],
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    Questions[currentLevel - 1],
                    style: GoogleFonts.tajawal(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                margin: const EdgeInsets.all(30),
                height: 500,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: levelsImages[currentLevel - 1].length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(30),
                      height: 40,
                      width: 40,
                      child: Image.asset(
                        levelsImages[currentLevel - 1][index],
                        width: 70.0,
                        height: 70.0,
                        fit: BoxFit.contain,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCubeButton('1'),
                  _buildCubeButton('2'),
                  _buildCubeButton('3'),
                  _buildCubeButton('4'),
                ],
              ),
              ConfettiWidget(
                confettiController: _confettiController,
                blastDirectionality: BlastDirectionality.explosive,
                shouldLoop: false,
                numberOfParticles: 5,
                gravity: 0.2,
                maxBlastForce: 100,
                minBlastForce: 80,
                colors: const [Colors.blue, Colors.green, Colors.pink],
              ),
            ],
          ),
          Positioned(
            top: 40.0,
            right: 10.0,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                'النقاط: $score',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCubeButton(String text) {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        color: co,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ElevatedButton(
        onPressed: () {
          if (correctAnswers[int.parse(text) - 1] == currentLevel) {
            // If the answer is correct, increase the score
            startNewLevel();
          } else {
            // If the answer is incorrect, move on to the next level without incrementing the score
            setState(() {
              startNewLevel_2();
            });
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: co == Colors.white ? Colors.black : Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }
}
