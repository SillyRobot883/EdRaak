import 'package:flutter/material.dart';
import 'package:test_1/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:confetti/confetti.dart';

class ResultPage extends StatefulWidget {
  final int score;
  final VoidCallback onRetryPressed;

  ResultPage({required this.score, required this.onRetryPressed});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController();
    if (widget.score == 4) {
      _startConfetti();
    }
  }

  void _startConfetti() {
    _confettiController.play();
    Future.delayed(const Duration(seconds: 3), () {
      _confettiController.stop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/ResultImage.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConfettiWidget(
                confettiController: _confettiController,
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
                  // Retry button pressed, restart the game
                  widget.onRetryPressed();
                  Navigator.pop(context);
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
                  // Main Menu button pressed, navigate to the main menu
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainApp()),
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
