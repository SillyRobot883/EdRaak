import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:confetti/confetti.dart';
import 'package:test_1/game1/The_game.dart';
import 'package:test_1/main_screen/main_menu.dart';

class ResultPage extends StatefulWidget {
  final int score;

  ResultPage({required this.score});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 1));
    if (widget.score == 4) {
      _startConfetti();
    }
  }

  void _startConfetti() {
    _confettiController.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/image/images/ResultImage.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConfettiWidget(            confettiController: _confettiController,
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: false,
            colors: const [
              Colors.blue,
              Colors.pink,
              Colors.purple
            ], // Changing the color of the confetti
          ),
          Text(
            'نقاطك: ${widget.score}',
            style: GoogleFonts.tajawal(
              fontSize: 24.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 60.0),
          ElevatedButton(
            onPressed: () {
              // Restart the game
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => The_game()),
                (Route<dynamic> route) => false,
              );
            },
            child: Text(
              'إعادة',
              style: GoogleFonts.tajawal(
                fontSize: 27.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () {
              // Navigate to the main menu
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MainMenu()),
                (Route<dynamic> route) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              minimumSize: const Size(224, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: Text(
              'الصفحة الرئيسية',
              style: GoogleFonts.tajawal(
                fontSize: 27.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
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
